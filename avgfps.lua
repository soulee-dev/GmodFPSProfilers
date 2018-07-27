local max = 0
local min = 500
local times = 0
local total = 0
local fps = 0

local avgfpsd = 0
local tt = 0

surface.CreateFont( "Rbto", {
	font = "Roboto",
	size = ScreenScale(15),
} )

hook.Add( "HUDPaint", "HUDPaint_DrawABox", function()
    times = times + 1
    total = total + fps
    fps =  math.Round(1/FrameTime(),2 )
    if( fps > max ) then max = fps end
    if( fps < min ) then min = fps end
    draw.SimpleText("FPS : " .. fps, "Rbto", ScreenScale(5), ScreenScale(0), Color(255,255,255))
    draw.SimpleText("Max FPS : " .. max, "Rbto", ScreenScale(5), ScreenScale(12), Color(255,255,255))
    draw.SimpleText("Min FPS : " .. min, "Rbto", ScreenScale(5), ScreenScale(24), Color(255,255,255))
    draw.SimpleText("AVG FPS : " .. math.Round((total/times), 2) , "Rbto", ScreenScale(5), ScreenScale(36), Color(255,255,255))
    draw.SimpleText("AVG FPS : " .. math.Round((avgfpsd/tt), 2), "Rbto", ScreenScale(5), ScreenScale(48), Color(255,255,255))
    draw.SimpleText("Timer : " .. tt , "Rbto", ScreenScale(110), ScreenScale(48), Color(255,255,255))
end )

local function avgfps()
    tt = tt + 1
    avgfpsd = avgfpsd + fps
end

function Timer(ttimes)
    avgfpsd = 0
    tt = 0
    timer.Create( "AVGFps", 1, ttimes, avgfps)
end
