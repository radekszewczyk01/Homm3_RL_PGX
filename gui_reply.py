import pygame
import sys
import pickle
import math
import argparse

# Importujemy wymiary z silnika
from jax_engine import BOARD_COLS, BOARD_ROWS, MAX_UNITS

# Ustawienia GUI
HEX_SIZE = 35  
MARGIN_X = 50
MARGIN_Y = 50
HEX_WIDTH = math.sqrt(3) * HEX_SIZE
HEX_HEIGHT = 2 * HEX_SIZE

COLOR_BG = (30, 30, 30)
COLOR_HEX_LINE = (100, 100, 100)
COLOR_A = (100, 150, 255)  
COLOR_B = (255, 100, 100)  
COLOR_TEXT = (255, 255, 255)
COLOR_ACTIVE_HIGHLIGHT = (255, 255, 0)

# Upewnij się, że ID zgadzają się z Twoimi nowymi armiami!
UNIT_NAMES = {
    0: "Pikeman", 1: "Archer", 2: "Griffin", 3: "Swordsman",
    7: "Pikeman", 8: "Archer", 9: "Griffin", 10: "Swordsman"
} 

# Nakładka maskująca słownik z JSON'a na klasę (żeby kod rysujący działał bez zmian)
class ReplayState:
    def __init__(self, data_dict):
        for k, v in data_dict.items():
            setattr(self, k, v)

def get_hex_vertices(center_x, center_y):
    vertices = []
    for i in range(6):
        angle_rad = math.radians(60 * i - 30)
        vertices.append((center_x + HEX_SIZE * math.cos(angle_rad), center_y + HEX_SIZE * math.sin(angle_rad)))
    return vertices

def get_center_offset(col, row):
    offset_x = (HEX_WIDTH / 2) if row % 2 != 0 else 0
    return MARGIN_X + col * HEX_WIDTH + offset_x, MARGIN_Y + row * (HEX_HEIGHT * 0.75)

def draw_board(screen, font, state):
    screen.fill(COLOR_BG)
    for r in range(BOARD_ROWS):
        for c in range(BOARD_COLS):
            cx, cy = get_center_offset(c, r)
            pygame.draw.polygon(screen, COLOR_HEX_LINE, get_hex_vertices(cx, cy), width=2)
            
    for u_id in range(MAX_UNITS):
        if state.alive[u_id]:
            idx = state.pos_idx[u_id]
            col, row = int(idx % BOARD_COLS), int(idx // BOARD_COLS)
            cx, cy = get_center_offset(col, row)
            vertices = get_hex_vertices(cx, cy)
            
            color = COLOR_A if state.side[u_id] == 0 else COLOR_B
            pygame.draw.polygon(screen, color, vertices)
            
            is_active = (u_id == state.active_unit_idx)
            pygame.draw.polygon(screen, COLOR_ACTIVE_HIGHLIGHT if is_active else COLOR_TEXT, vertices, width=4 if is_active else 2)
            
            name = UNIT_NAMES.get(int(u_id), "?")
            text = font.render(f"{name[0]}({state.count[u_id]})", True, COLOR_TEXT)
            screen.blit(text, text.get_rect(center=(cx, cy)))

def main():
    parser = argparse.ArgumentParser(description="Odtwarzacz powtórek AlphaZero")
    parser.add_argument("plik", type=str, help="Ścieżka do pliku .pkl, np. replay_gen_10.pkl")
    args = parser.parse_args()

    try:
        with open(args.plik, "rb") as f:
            frames_data = pickle.load(f)
    except FileNotFoundError:
        print(f"❌ Nie znaleziono pliku: {args.plik}")
        sys.exit()

    frames = [ReplayState(d) for d in frames_data]
    current_frame = 0

    pygame.init()
    screen = pygame.display.set_mode((int(BOARD_COLS * HEX_WIDTH + MARGIN_X * 2 + HEX_WIDTH / 2), 
                                      int(BOARD_ROWS * HEX_HEIGHT * 0.75 + MARGIN_Y * 2 + HEX_HEIGHT / 4)))
    pygame.display.set_caption(f"Powtórka: {args.plik}")
    font = pygame.font.SysFont("Arial", 14, bold=True)
    
    print(f"✅ Wczytano {len(frames)} klatek. Użyj SPACJI (następny krok), BACKSPACE (poprzedni), ESC (wyjście).")

    while True:
        state = frames[current_frame]
        draw_board(screen, font, state)
        
        # Wyświetlanie informacji na ekranie
        info_text = font.render(f"Tura: {current_frame}/{len(frames)-1} | Terminated: {state.terminated}", True, (255, 255, 0))
        screen.blit(info_text, (10, 10))
        
        pygame.display.flip()

        for event in pygame.event.get():
            if event.type == pygame.QUIT or (event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE):
                pygame.quit()
                sys.exit()
            
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_SPACE:
                    current_frame = min(current_frame + 1, len(frames) - 1)
                    if frames[current_frame].terminated and not frames[current_frame-1].terminated:
                        print(f"Bitwa zakończona na klatce {current_frame}. Nagrody: {frames[current_frame].rewards}")
                elif event.key == pygame.K_BACKSPACE:
                    current_frame = max(current_frame - 1, 0)

if __name__ == "__main__":
    main()