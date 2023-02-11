@echo off

mkdocs build && git add . && git commit -m "fast build site" && git push