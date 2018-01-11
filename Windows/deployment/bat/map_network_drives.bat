@echo off
@echo DON'T CLOSE THIS WINDOW

@echo mounting Personal to P:
net use p: \\10.0.0.251\personal /p:yes

@echo mounting renders to V:
net use v: \\10.0.0.251\renders /p:yes

@echo mounting pipeline to U:
net use u: \\10.0.0.251\pipeline /p:yes

@echo mounting tf_demon_pipeline to Z:
net use z: \\10.0.0.251\tfdemo_pipeline /p:yes

:exit
