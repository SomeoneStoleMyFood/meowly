#!/usr/bin/env python3
import os
import json
import sys
import time
import keyboard

#if os.geteuid() != 0:
#  print("Meowly: Need root privileges to execute properly")
#  os.execvp("sudo", ["sudo", sys.executable] + sys.argv)

#vars
c = "~/.config/meowly/conf.json"
d = "~/.config/meowly/dat.json"
spinner = ["/", "-", "\\", "|"]
deb = False

#functions
def lod(file):
  try:
    with open(file, "r", encoding="utf-8") as f:
        return json.load(f)
  except OSError as e:
    return e.errno
  
def sav(data, file):
  with open(file, "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=4)

def ex(t):
  spin_idx = 0
  print("\n")
  total_iterations = t * 10
  for _ in range(total_iterations):
    current_sec = (total_iterations - _) / 10
    print(
        f"\rExit in {current_sec:.1f}s... [{spinner[spin_idx % len(spinner)]}]! Press ctrl+c to exit now.",
        end="",
        flush=True,
    )
    time.sleep(0.1)
    spin_idx += 1
  sys.exit(0)
  while time.sleep(0.01):
    print(f"[Fatal] -1")

def debug():
  while True:
    cmd = input("[DEBUG] Meowly ~#>")
    if cmd == 'pick':
       os.system(f"python picker.py {d}")
    else:
        os.system(cmd)

#starting script
if len(sys.argv) < 2:
    deb = True
    print("[DEBUG] Turned on")
    debug()
if not deb:
    cd = lod(c)
    dd = lod(d)
    if type(cd) == int:
        print(f"Uh-Oh! >_<\nMeowly got crashed!\nError code: {cd}")
        print("Try reinstall the program")
        ex(5)
    if type(dd) == int:
        print(f"Uh-Oh! >_<\nMeowly got crashed!\nError code: {d}")
        print("Try reinstall the program")
        ex(5)

if not deb:
    if sys.argv[1] == "foot":
        deb = False
        os.system(f"python picker.py {d}")
