@echo off
@echo DON'T CLOSE THIS WINDOW

@echo mounting Personal to P:
net use p: \\10.0.0.251\personal /p:yes

:exit
