import time
import jax
import jax.numpy as jnp

print("jax", jax.__version__, jax.devices())

def zmierz(opis, f, x, N):
    f(x).block_until_ready()                 # kompilacja
    t0 = time.perf_counter()
    for _ in range(N):
        x = f(x)
    x.block_until_ready()
    dt = time.perf_counter() - t0
    print(f"  {opis:38s} {1e6*dt/N:8.2f} us/uruchomienie")
    return x

print("\n[1] narzut zlecania - jadro trywialne")
f = jax.jit(lambda x: x + 1.0)
for n in (16, 4096, 262144):
    zmierz(f"dodawanie, {n:>7d} elementow", f, jnp.ones((n,), jnp.float32), 20000)

print("\n[2] to samo, ale 1000 iteracji ZFUZOWANYCH w jedno jadro")
g = jax.jit(lambda x: jax.lax.fori_loop(0, 1000, lambda i, v: v + 1.0, x))
x = jnp.ones((4096,), jnp.float32)
g(x).block_until_ready()
t0 = time.perf_counter()
for _ in range(50):
    x = g(x)
x.block_until_ready()
dt = time.perf_counter() - t0
print(f"  50 x 1000 iteracji w jednym jadrze     {1e6*dt/(50*1000):8.3f} us/iteracje")

print("\n[3] praca realna - mnozenie macierzy 2048x2048")
h = jax.jit(lambda a: a @ a)
a = jnp.ones((2048, 2048), jnp.float32)
h(a).block_until_ready()
t0 = time.perf_counter()
for _ in range(200):
    a2 = h(a)
a2.block_until_ready()
dt = time.perf_counter() - t0
print(f"  mnozenie macierzy                      {1e6*dt/200:8.2f} us/uruchomienie")
