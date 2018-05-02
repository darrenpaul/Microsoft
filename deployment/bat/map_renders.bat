@echo off
@echo DON'T CLOSE THIS WINDOW

@echo mounting Royal Render to R:
net use r: \\10.0.0.251\royal /p:yes

@echo mounting renders to V:
net use v: \\10.0.0.251\renders /p:yes

:exit
