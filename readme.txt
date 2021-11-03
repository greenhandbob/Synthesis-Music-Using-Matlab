This is a simple version music synthesis program that can simulate instrument running on MATLAB 2021b. 

The codes have annotations and bugs within, for learning and communications only.

the code in the files are example of "TianKongZhiCheng", a music simulation of "suona".

the standard notes are extract from: https://www.youtube.com/watch?v=Ju3OPu0r_14

There the five component to synthesis music file:

1.The tone2freq.m file, calculate fundamental frequency of a single note using 4 input variables, which are annotated.

2.The envelop.m file, synthesis the ADSR envelope attenuation function variables annotated.

3.virtuoso.m and virtuosoi.m file: extract "eigenfunction" from stardand notes, this part of code is inspired by:
	https://www.bilibili.com/video/BV1h7411H7nK
	https://github.com/Iridium-191/MATBAND

4.gen_wave.m file: synthesis the components mentioned above and generate sound wave can be heard by ear

5.gen_music: where you write the main project and generate the music file. 


Created by Altair, For learning and communications only. For other uses please contact the author(1749727337@qq.com) 