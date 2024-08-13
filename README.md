# Config Ubuntu

A Bash utility for installing various programs.
Feel free to clone and customize or copy to get ideas of your own.

There are probably better approaches to installer scripts such as provisions but sometimes those are a bit tedious. It's also a bit fun to use pure `bash` to write something custom.

![Screenshot](https://private-user-images.githubusercontent.com/145959/357254178-ade79ed6-f094-4340-82e7-7bfc85111858.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MjM1MTU0ODIsIm5iZiI6MTcyMzUxNTE4MiwicGF0aCI6Ii8xNDU5NTkvMzU3MjU0MTc4LWFkZTc5ZWQ2LWYwOTQtNDM0MC04MmU3LTdiZmM4NTExMTg1OC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwODEzJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDgxM1QwMjEzMDJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0xMWJjOTY3NGU3ZmViNTIxOGFiYzFjOGM3MzYyYjAxZDkzMmNkYWEzMWIyZWYzZGRmMWY1NTBiMzQyYzRlZmVjJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.gBWz3dqOEtYMcZZmBkMR7Tdzy_M4aTKa9t6dYIGT6ds)


## File Setup

This is a brief explanation of the file setup if you choose to clone or get ideas for your own utility script.

> HELPFUL: Think of the `./bin` scripts as containers to customize your preferred way of installing a package or category of pacakges.

- **File Structure**
- `./installable.sh` - Entrypoint; Lists all installable items which are only defined in this file.
  - Above triggers a file in `./bin/*.sh`, it will first `source _export.sh` for color variables and log functions for the installer output.
  - Next, the respective file, optionally with an `$1` argument is loaded into a `./bin/<file-here>.sh` to execute the installer.

It should be pretty simple!

---
MIT Open Source

&copy; 2014 [JREAM](https://jream.com)
