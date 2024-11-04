import vapoursynth as vs
import logging

from vapoursynth import core
core.num_threads = 16
core.max_cache_size = 8192

super_params="{gpu:1}"
analyse_params="{gpu:1},{block:{overlap:3,w:16,h:16}}"
# smoothfps_params="{rate:{num:60000,den:1001,abs:true},algo:23}"
smoothfps_params="{rate:{num:60,den:1,abs:true},scale:{up:2,down:4},pel:1,gpu:1,algo:13}"

clip = video_in

if   clip.format.id==vs.YUV420P8:
     clip_8 = clip
elif clip.format.id==vs.YUV420P10:
     clip_8 = core.fmtc.bitdepth (clip, bits=8,dmode=0)
else:
     clip_8 = core.fmtc.bitdepth (clip, bits=16,dmode=0) 
     clip_8 = core.fmtc.resample (clip_8, css="420",kernel="spline36",interlaced=0, interlacedd=0)
     clip_8 = core.fmtc.bitdepth (clip_8, bits=8,dmode=0)

super = core.svp1.Super(clip_8,super_params)

vectors = core.svp1.Analyse(super["clip"],super["data"],clip_8,analyse_params)

# smooth = core.svp2.SmoothFps(clip_8,super["clip"],super["data"],vectors["clip"],vectors["data"],smoothfps_params,src=clip_8,fps=30.0/1.001)
smooth = core.svp2.SmoothFps(clip_8,super["clip"],super["data"],vectors["clip"],vectors["data"],smoothfps_params,src=clip_8,fps=container_fps)

smooth = core.std.AssumeFPS(smooth,fpsnum=smooth.fps_num,fpsden=smooth.fps_den)

smooth.set_output()






# import vapoursynth as vs
# core = vs.get_core(threads=16)
# clip = video_in

# if   clip.format.id==vs.YUV420P8:
#      clip_8 = clip
# elif clip.format.id==vs.YUV420P10:
#      clip_8 = core.fmtc.bitdepth (clip, bits=8,dmode=0)
# else:
#      clip_8 = core.fmtc.bitdepth (clip, bits=16,dmode=0) 
#      clip_8 = core.fmtc.resample (clip_8, css="420",kernel="spline36",interlaced=0, interlacedd=0)
#      clip_8 = core.fmtc.bitdepth (clip_8, bits=8,dmode=0)

# super = core.svp1.Super(clip_8,"{pel:2,gpu:1,full:true,scale:{up:2,down:4},rc:0}")
# vectors = core.svp1.Analyse(super["clip"],super["data"],clip,"{gpu:1,vectors:3,block:{w:16,h:16,overlap:3},main:{levels:0,search:{type:4,distance:-4,sort:true,satd:false,coarse:{width:1050,type:4,distance:0,satd:true,trymany:false,bad:{sad:1000,range:-24}}},penalty:{lambda:10,plevel:1.5,lsad:8000,pnew:50,pglobal:50,pzero:100,pnbour:50,prev:0}},refine:[{thsad:200,search:{type:4,distance:2,satd:false},penalty:{pnew:50}}],special:{delta:1}}")
# smooth = core.svp2.SmoothFps(clip_8,super["clip"],super["data"],vectors["clip"],vectors["data"],"{rate:{num:2,den:1,abs:false},algo:13,block:false,cubic:1,gpuid:0,linear:true,mask:{cover:100,area:0,area_sharp:1},scene:{mode:3,blend:false,limits:{m1:1600,m2:2800,scene:4000,zero:200,blocks:20},luma:1.5},light:{aspect:0,sar:1,zoom:0,lights:16,length:100,cell:1,border:12}}",src=clip_8,fps=container_fps)
# smooth = core.std.AssumeFPS(smooth,fpsnum=smooth.fps_num,fpsden=smooth.fps_den)
# smooth.set_output()
