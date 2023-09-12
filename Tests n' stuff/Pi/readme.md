python vs mojo calculating pi
100 million itterations each

Python: 
```bash
3.141592643589326

________________________________________________________
Executed in   24.43 secs    fish           external
   usr time   24.41 secs    0.00 micros   24.41 secs
   sys time    0.00 secs  378.00 micros    0.00 secs

```

Mojo:
```bash
3.141592643589326

________________________________________________________
Executed in    1.81 secs    fish           external
   usr time    1.83 secs  252.00 micros    1.83 secs
   sys time    0.01 secs   40.00 micros    0.01 secs

```

speedup:
approx. 13.5x

No optimisations made

Test environment:
- Distrobox (ubuntu) running on nixos
- Ryzen 9 5900HS
- 24GB DDR4 3200MHz RAM

