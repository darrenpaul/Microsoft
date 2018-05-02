@echo off
@echo DON'T CLOSE THIS WINDOW

@echo mounting tf_demon_pipeline to Z:
net use z: \\10.0.0.251\tfdemo_pipeline /p:yes

:exit
