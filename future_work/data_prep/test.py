import pandas as pd
df = pd.read_csv("homm3_creatures_clean.csv")

print("dwuheksowe ogółem:", int(df.is_two_hex.sum()))
print("w tierze 60-700:",
      df[(df.is_two_hex == 1) & df.ai_value.between(60, 700)].name.tolist())

print("\nkontrola literówek:")
for n in ["Griffin", "Royal Griffin", "Centaur Captain", "Thunderbird",
          "Behemoth", "Water Elemental", "Ice Elemental"]:
    r = df[df.name == n]
    print(f"  {n:<18}", "BRAK W CSV" if r.empty
          else f"2hex={int(r.is_two_hex.iloc[0])}")

print("\nuszkodzone ai_value:")
print(df[df.ai_value > 100_000][["unit_id", "name", "ai_value"]])