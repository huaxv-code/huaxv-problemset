@echo off

mkdocs build && git add . && git commit -m "%*" && git push