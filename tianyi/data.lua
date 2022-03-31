local characteranimations = {}
local animations_live = {}
local animations_dead = {}
local imgpath = "__tianyi__/images/"

local function getDead()
    return {
        filename = imgpath .. "dead.png",
        width = 200,
        height = 200,
        --shift = util.by_pixel(0.0, -0.0),
        frame_count = 2,
        scale = 0.3,
        hr_version = {
            filename = imgpath .. "dead.png",
            width = 200,
            height = 200,
            --shift = util.by_pixel(0.0, -0.0),
            frame_count = 2,
            scale = 0.3,
        }
    }
end
local function getRunning()
    return {
        filename = imgpath .. "running.png",
        width = 200,
        height = 200,
        --shift = util.by_pixel(0.0, -23.0),
        frame_count = 24,
        direction_count = 8,
        animation_speed = 0.8,
        scale = 0.3,
        hr_version = {
            filename = imgpath .. "running.png",
            width = 200,
            height = 200,
            --shift = util.by_pixel(0.0, -23.0),
            frame_count = 24,
            direction_count = 8,
            animation_speed = 0.8,
            scale = 0.3,
        }
    }
end

local function getRunningGun()
    return {
        filename = imgpath .. "running-gun.png",
        width = 200,
        height = 200,
        --shift = util.by_pixel(0.0, -23.0),
        frame_count = 24,
        direction_count = 18,
        animation_speed = 0.8,
        scale = 0.3,
        hr_version = {
            filename = imgpath .. "running-gun.png",
            width = 200,
            height = 200,
            --shift = util.by_pixel(0.0, -23.0),
            frame_count = 24,
            direction_count = 18,
            animation_speed = 0.8,
            scale = 0.3,
        }
    }
end

local function getIdlePics()
    return {
        imgpath .. "idle/1.png",
        imgpath .. "idle/2.png",
        imgpath .. "idle/3.png",
        imgpath .. "idle/4.png",
        imgpath .. "idle/5.png",
        imgpath .. "idle/6.png",
        imgpath .. "idle/7.png",
        imgpath .. "idle/8.png",
        imgpath .. "idle/9.png",
        imgpath .. "idle/10.png",
        imgpath .. "idle/11.png",
        imgpath .. "idle/12.png",
        imgpath .. "idle/13.png",
        imgpath .. "idle/14.png",
        imgpath .. "idle/15.png",
        imgpath .. "idle/16.png",
        imgpath .. "idle/17.png",
        imgpath .. "idle/18.png",
        imgpath .. "idle/19.png",
        imgpath .. "idle/20.png",
        imgpath .. "idle/21.png",
        imgpath .. "idle/22.png",
        imgpath .. "idle/23.png",
        imgpath .. "idle/24.png",
        imgpath .. "idle/25.png",
        imgpath .. "idle/26.png",
        imgpath .. "idle/27.png",
        imgpath .. "idle/28.png",
        imgpath .. "idle/29.png",
        imgpath .. "idle/30.png",
        imgpath .. "idle/31.png",
        imgpath .. "idle/32.png",
        imgpath .. "idle/33.png",
        imgpath .. "idle/34.png",
        imgpath .. "idle/35.png",
        imgpath .. "idle/36.png",
        imgpath .. "idle/37.png",
        imgpath .. "idle/38.png",
        imgpath .. "idle/39.png",
        imgpath .. "idle/40.png",
        imgpath .. "idle/41.png",
        imgpath .. "idle/42.png",
        imgpath .. "idle/43.png",
        imgpath .. "idle/44.png",
        imgpath .. "idle/45.png",
        imgpath .. "idle/46.png",
        imgpath .. "idle/47.png",
        imgpath .. "idle/48.png",
        imgpath .. "idle/49.png",
        imgpath .. "idle/50.png",
        imgpath .. "idle/51.png",
        imgpath .. "idle/52.png",
        imgpath .. "idle/53.png",
        imgpath .. "idle/54.png",
        imgpath .. "idle/55.png",
        imgpath .. "idle/56.png",
        imgpath .. "idle/57.png",
        imgpath .. "idle/58.png",
        imgpath .. "idle/59.png",
        imgpath .. "idle/60.png",
        imgpath .. "idle/61.png",
        imgpath .. "idle/62.png",
        imgpath .. "idle/63.png",
        imgpath .. "idle/64.png",
        imgpath .. "idle/65.png",
        imgpath .. "idle/66.png",
        imgpath .. "idle/67.png",
        imgpath .. "idle/68.png",
        imgpath .. "idle/69.png",
        imgpath .. "idle/70.png",
        imgpath .. "idle/71.png",
        imgpath .. "idle/72.png",
        imgpath .. "idle/73.png",
        imgpath .. "idle/74.png",
        imgpath .. "idle/75.png",
        imgpath .. "idle/76.png",
        imgpath .. "idle/77.png",
        imgpath .. "idle/78.png",
        imgpath .. "idle/79.png",
        imgpath .. "idle/80.png",
        imgpath .. "idle/81.png",
        imgpath .. "idle/82.png",
        imgpath .. "idle/83.png",
        imgpath .. "idle/84.png",
        imgpath .. "idle/85.png",
        imgpath .. "idle/86.png",
        imgpath .. "idle/87.png",
        imgpath .. "idle/88.png",
        imgpath .. "idle/89.png",
        imgpath .. "idle/90.png",
        imgpath .. "idle/91.png",
        imgpath .. "idle/92.png",
        imgpath .. "idle/93.png",
        imgpath .. "idle/94.png",
        imgpath .. "idle/95.png",
        imgpath .. "idle/96.png",
        imgpath .. "idle/97.png",
        imgpath .. "idle/98.png",
        imgpath .. "idle/99.png",
        imgpath .. "idle/100.png",
        imgpath .. "idle/101.png",
        imgpath .. "idle/102.png",
        imgpath .. "idle/103.png",
        imgpath .. "idle/104.png",
        imgpath .. "idle/105.png",
        imgpath .. "idle/106.png",
        imgpath .. "idle/107.png",
        imgpath .. "idle/108.png",
        imgpath .. "idle/109.png",
        imgpath .. "idle/110.png",
        imgpath .. "idle/111.png",
        imgpath .. "idle/112.png",
        imgpath .. "idle/113.png",
        imgpath .. "idle/114.png",
        imgpath .. "idle/115.png",
        imgpath .. "idle/116.png",
        imgpath .. "idle/117.png",
        imgpath .. "idle/118.png",
        imgpath .. "idle/119.png",
        imgpath .. "idle/120.png",
        imgpath .. "idle/121.png",
        imgpath .. "idle/122.png",
        imgpath .. "idle/123.png",
        imgpath .. "idle/124.png",
        imgpath .. "idle/125.png",
        imgpath .. "idle/126.png",
        imgpath .. "idle/127.png",
        imgpath .. "idle/128.png",
        imgpath .. "idle/129.png",
        imgpath .. "idle/130.png",
        imgpath .. "idle/131.png",
        imgpath .. "idle/132.png",
        imgpath .. "idle/133.png",
        imgpath .. "idle/134.png",
        imgpath .. "idle/135.png",
        imgpath .. "idle/136.png",
        imgpath .. "idle/137.png",
        imgpath .. "idle/138.png",
        imgpath .. "idle/139.png",
        imgpath .. "idle/140.png",
        imgpath .. "idle/141.png",
        imgpath .. "idle/142.png",
        imgpath .. "idle/143.png",
        imgpath .. "idle/144.png",
        imgpath .. "idle/145.png",
        imgpath .. "idle/146.png",
        imgpath .. "idle/147.png",
        imgpath .. "idle/148.png",
        imgpath .. "idle/149.png",
        imgpath .. "idle/150.png",
        imgpath .. "idle/151.png",
        imgpath .. "idle/152.png",
        imgpath .. "idle/153.png",
        imgpath .. "idle/154.png",
        imgpath .. "idle/155.png",
        imgpath .. "idle/156.png",
        imgpath .. "idle/157.png",
        imgpath .. "idle/158.png",
        imgpath .. "idle/159.png",
        imgpath .. "idle/160.png",
        imgpath .. "idle/161.png",
        imgpath .. "idle/162.png",
        imgpath .. "idle/163.png",
        imgpath .. "idle/164.png",
        imgpath .. "idle/165.png",
        imgpath .. "idle/166.png",
        imgpath .. "idle/167.png",
        imgpath .. "idle/168.png",
        imgpath .. "idle/169.png",
        imgpath .. "idle/170.png",
        imgpath .. "idle/171.png",
        imgpath .. "idle/172.png",
        imgpath .. "idle/173.png",
        imgpath .. "idle/174.png",
        imgpath .. "idle/175.png",
        imgpath .. "idle/176.png",
        imgpath .. "idle/177.png",
        imgpath .. "idle/178.png",
        imgpath .. "idle/179.png",
        imgpath .. "idle/180.png",
        imgpath .. "idle/181.png",
        imgpath .. "idle/182.png",
        imgpath .. "idle/183.png",
        imgpath .. "idle/184.png",
        imgpath .. "idle/185.png",
        imgpath .. "idle/186.png",
        imgpath .. "idle/187.png",
        imgpath .. "idle/188.png",
        imgpath .. "idle/189.png",
        imgpath .. "idle/190.png",
        imgpath .. "idle/191.png",
        imgpath .. "idle/192.png",
        imgpath .. "idle/193.png",
        imgpath .. "idle/194.png",
        imgpath .. "idle/195.png",
        imgpath .. "idle/196.png",
        imgpath .. "idle/197.png",
        imgpath .. "idle/198.png",
        imgpath .. "idle/199.png",
        imgpath .. "idle/200.png",
        imgpath .. "idle/201.png",
        imgpath .. "idle/202.png",
        imgpath .. "idle/203.png",
        imgpath .. "idle/204.png",
        imgpath .. "idle/205.png",
        imgpath .. "idle/206.png",
        imgpath .. "idle/207.png",
        imgpath .. "idle/208.png",
        imgpath .. "idle/209.png",
        imgpath .. "idle/210.png",
        imgpath .. "idle/211.png",
        imgpath .. "idle/212.png",
        imgpath .. "idle/213.png",
        imgpath .. "idle/214.png",
        imgpath .. "idle/215.png",
        imgpath .. "idle/216.png",
        imgpath .. "idle/217.png",
        imgpath .. "idle/218.png",
        imgpath .. "idle/219.png",
        imgpath .. "idle/220.png",
        imgpath .. "idle/221.png",
        imgpath .. "idle/222.png",
        imgpath .. "idle/223.png",
        imgpath .. "idle/224.png",
        imgpath .. "idle/225.png",
        imgpath .. "idle/226.png",
        imgpath .. "idle/227.png",
        imgpath .. "idle/228.png",
        imgpath .. "idle/229.png",
        imgpath .. "idle/230.png",
        imgpath .. "idle/231.png",
        imgpath .. "idle/232.png",
        imgpath .. "idle/233.png",
        imgpath .. "idle/234.png",
        imgpath .. "idle/235.png",
        imgpath .. "idle/236.png",
        imgpath .. "idle/237.png",
        imgpath .. "idle/238.png",
        imgpath .. "idle/239.png",
        imgpath .. "idle/240.png",
        imgpath .. "idle/241.png",
        imgpath .. "idle/242.png",
        imgpath .. "idle/243.png",
        imgpath .. "idle/244.png",
        imgpath .. "idle/245.png",
        imgpath .. "idle/246.png",
        imgpath .. "idle/247.png",
        imgpath .. "idle/248.png",
        imgpath .. "idle/249.png",
        imgpath .. "idle/250.png",
        imgpath .. "idle/251.png",
        imgpath .. "idle/252.png",
        imgpath .. "idle/253.png",
        imgpath .. "idle/254.png",
        imgpath .. "idle/255.png",
    }
end

local function getIdle()
    return {
        filenames = getIdlePics(),
        slice = 1,
        width = 200,
        height = 200,
        shift = util.by_pixel(-20.0, 0.0),
        frame_count = 255,
        line_length = 1,
        lines_per_file = 1,
        direction_count = 1,
        animation_speed = 0.2,
        scale = 0.4,
        hr_version = {
            filenames = getIdlePics(),
            slice = 1,
            width = 200,
            height = 200,
            shift = util.by_pixel(-20.0, 0.0),
            frame_count = 255,
            line_length = 1,
            lines_per_file = 1,
            direction_count = 1,
            animation_speed = 0.2,
            scale = 0.4
        }
    }
end

characteranimations["level1"] = {}

characteranimations["level1"]["dead"] = getDead()

characteranimations["level1"]["dead_shadow"] = nil,
{
    filename = imgpath .. "level1_dead_shadow.png",
    width = 50,
    height = 80,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 2,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_dead_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 2,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["dead_mask"] = nil,
{
    filename = imgpath .. "level1_dead_mask.png",
    width = 50,
    height = 80,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 2,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_dead_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 2,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["idle"] = getIdle()

characteranimations["level1"]["idle_mask"] = nil,
{
    filename = imgpath .. "level1_idle_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["idle_shadow"] = nil,
{
    filename = imgpath .. "level1_idle_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_idle_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["idle_gun"] = getIdle()

characteranimations["level1"]["idle_gun_mask"] = nil,
{
    filename = imgpath .. "level1_idle_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["idle_gun_shadow"] = nil,
{
    filename = imgpath .. "level1_idle_gun_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_idle_gun_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["mining_hands"] = getIdle()
characteranimations["level1"]["mining_hands_mask"] = nil,
{
    filename = imgpath .. "level1_mining_hands_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_hands_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["mining_hands_shadow"] = nil,
{
    filename = imgpath .. "level1_mining_hands_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_mining_hands_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["mining_tool"] = getIdle()
characteranimations["level1"]["mining_tool_mask"] = nil,
{
    filename = imgpath .. "level1_mining_tool_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.9,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_tool_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.9,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["mining_tool_shadow"] = nil,
{
    filename = imgpath .. "level1_mining_tool_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.9,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_mining_tool_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.9,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["running"] = getRunning()
characteranimations["level1"]["running_mask"] = nil,
{
    filename = imgpath .. "level1_running_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["running_shadow"] = nil,
{
    filename = imgpath .. "level1_running_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_running_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}
characteranimations["level1"]["running_gun"] = getRunningGun()
characteranimations["level1"]["running_gun_mask"] = nil,
{
    filename = imgpath .. "level1_running_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 18,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level1"]["running_gun_shadow"] = nil,
{
    filename = imgpath .. "level1_running_gun_shadow.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 18,
    animation_speed = 0.6,
    DRAWASSHADOW = true,
    hr_version = {
        filename = imgpath .. "level1_running_gun_shadow.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        DRAWASSHADOW = true,
        scale = 0.5
    }
}

characteranimations["level2addon"] = {}

characteranimations["level2addon"]["dead"] = getDead()
characteranimations["level2addon"]["dead_mask"] = nil,
{
    filename = imgpath .. "level1_dead_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 2,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_dead_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 2,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["idle"] = getIdle()
characteranimations["level2addon"]["idle_mask"] = nil,
{
    filename = imgpath .. "level1_idle_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["idle_gun"] = getIdle()
characteranimations["level2addon"]["idle_gun_mask"] = nil,
{
    filename = imgpath .. "level1_idle_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["mining_hands"] = getIdle()
characteranimations["level2addon"]["mining_hands_mask"] = nil,
{
    filename = imgpath .. "level1_mining_hands_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_hands_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["mining_tool"] = getIdle()
characteranimations["level2addon"]["mining_tool_mask"] = nil,
{
    filename = imgpath .. "level1_mining_tool_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.9,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_tool_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.9,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["running"] = getRunning()
characteranimations["level2addon"]["running_mask"] = nil,
{
    filename = imgpath .. "level1_running_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level2addon"]["running_gun"] = getRunningGun()
characteranimations["level2addon"]["running_gun_mask"] = nil,
{
    filename = imgpath .. "level1_running_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 18,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}

characteranimations["level3addon"] = {}

characteranimations["level3addon"]["dead"] = getDead()
characteranimations["level3addon"]["dead_mask"] = nil,
{
    filename = imgpath .. "level1_dead_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 2,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_dead_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 2,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["idle"] = getIdle()
characteranimations["level3addon"]["idle_mask"] = nil,
{
    filename = imgpath .. "level1_idle_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["idle_gun"] = getIdle()
characteranimations["level3addon"]["idle_gun_mask"] = nil,
{
    filename = imgpath .. "level1_idle_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.15,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_idle_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.15,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["mining_hands"] = getIdle()
characteranimations["level3addon"]["mining_hands_mask"] = nil,
{
    filename = imgpath .. "level1_mining_hands_mask.png",
    width = 50,
    height = 80,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_hands_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["mining_tool"] = getIdle()
characteranimations["level3addon"]["mining_tool_mask"] = nil,
{
    filename = imgpath .. "level1_mining_tool_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.9,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_mining_tool_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.9,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["running"] = getRunning()
characteranimations["level3addon"]["running_mask"] = nil,
{
    filename = imgpath .. "level1_running_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 8,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 8,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}
characteranimations["level3addon"]["running_gun"] = getRunningGun()
characteranimations["level3addon"]["running_gun_mask"] = nil,
{
    filename = imgpath .. "level1_running_gun_mask.png",
    width = 100,
    height = 160,
    shift = util.by_pixel(0.0, -21.0),
    frame_count = 22,
    direction_count = 18,
    animation_speed = 0.6,
    apply_runtime_tint = true,
    hr_version = {
        filename = imgpath .. "level1_running_gun_mask.png",
        width = 100,
        height = 160,
        shift = util.by_pixel(0.0, -21.0),
        frame_count = 22,
        direction_count = 18,
        animation_speed = 0.6,
        apply_runtime_tint = true,
        scale = 0.5
    }
}

animations_live = {
    {
        idle = {
            layers = {
                characteranimations["level1"]["idle"],
                --characteranimations["level1"]["idle_mask"],
                --characteranimations["level1"]["idle_shadow"],
            }
        },
        idle_with_gun = {
            layers = {
                characteranimations["level1"]["idle_gun"],
                --characteranimations["level1"]["idle_gun_mask"],
                --characteranimations["level1"]["idle_gun_shadow"],
            }
        },
        mining_with_hands = {
            layers = {
                characteranimations["level1"]["mining_hands"],
                characteranimations["level1"]["mining_hands_mask"],
                characteranimations["level1"]["mining_hands_shadow"],
            }
        },
        mining_with_tool = {
            layers = {
                characteranimations["level1"]["mining_tool"],
                characteranimations["level1"]["mining_tool_mask"],
                characteranimations["level1"]["mining_tool_shadow"],
            }
        },
        running_with_gun = {
            layers = {
                characteranimations["level1"]["running_gun"],
                characteranimations["level1"]["running_gun_mask"],
                characteranimations["level1"]["running_gun_shadow"],
            }
        },
        running = {
            layers = {
                characteranimations["level1"]["running"],
                characteranimations["level1"]["running_mask"],
                characteranimations["level1"]["running_shadow"],
            }
        }
    },
    {

        armors = data.is_demo and { "light-armor" } or { "light-armor", "heavy-armor" },
        idle = {
            layers = {
                characteranimations["level2addon"]["idle"],
                characteranimations["level2addon"]["idle_mask"],
                characteranimations["level1"]["idle_shadow"],
            }
        },
        idle_with_gun = {
            layers = {
                characteranimations["level2addon"]["idle_gun"],
                characteranimations["level2addon"]["idle_gun_mask"],
                characteranimations["level1"]["idle_gun_shadow"],
            }
        },
        mining_with_hands = {
            layers = {
                characteranimations["level2addon"]["mining_hands"],
                characteranimations["level2addon"]["mining_hands_mask"],
                characteranimations["level1"]["mining_hands_shadow"],
            }
        },
        mining_with_tool = {
            layers = {
                characteranimations["level2addon"]["mining_tool"],
                characteranimations["level2addon"]["mining_tool_mask"],
                characteranimations["level1"]["mining_tool_shadow"],
            }
        },
        running_with_gun = {
            layers = {
                characteranimations["level2addon"]["running_gun"],
                characteranimations["level2addon"]["running_gun_mask"],
                characteranimations["level1"]["running_gun_shadow"],
            }
        },
        running = {
            layers = {
                characteranimations["level2addon"]["running"],
                characteranimations["level2addon"]["running_mask"],
                characteranimations["level1"]["running_shadow"],
            }
        }
    },
    {

        armors = data.is_demo and {} or { "modular-armor", "power-armor", "power-armor-mk2" },
        idle = {
            layers = {
                characteranimations["level3addon"]["idle"],
                characteranimations["level3addon"]["idle_mask"],
                characteranimations["level1"]["idle_shadow"],
            }
        },
        idle_with_gun = {
            layers = {
                characteranimations["level3addon"]["idle_gun"],
                characteranimations["level3addon"]["idle_gun_mask"],
                characteranimations["level1"]["idle_gun_shadow"],
            }
        },
        mining_with_hands = {
            layers = {
                characteranimations["level3addon"]["mining_hands"],
                characteranimations["level3addon"]["mining_hands_mask"],
                characteranimations["level1"]["mining_hands_shadow"],
            }
        },
        mining_with_tool = {
            layers = {
                characteranimations["level3addon"]["mining_tool"],
                characteranimations["level3addon"]["mining_tool_mask"],
                characteranimations["level1"]["mining_tool_shadow"],
            }
        },
        running_with_gun = {
            layers = {
                characteranimations["level3addon"]["running_gun"],
                characteranimations["level3addon"]["running_gun_mask"],
                characteranimations["level1"]["running_gun_shadow"],
            }
        },
        running = {
            layers = {
                characteranimations["level3addon"]["running"],
                characteranimations["level3addon"]["running_mask"],
                characteranimations["level1"]["running_shadow"],
            }
        }
    }
}

animations_dead = {
    {
        layers = {
            characteranimations["level1"]["dead"],
            characteranimations["level1"]["dead_mask"],
            characteranimations["level1"]["dead_shadow"],
        }
    },
    {
        layers = {
            characteranimations["level2addon"]["dead"],
            characteranimations["level2addon"]["dead_mask"],
            characteranimations["level1"]["dead_shadow"],
        }
    },
    {
        layers = {
            characteranimations["level3addon"]["dead"],
            characteranimations["level3addon"]["dead_mask"],
            characteranimations["level1"]["dead_shadow"],
        }
    }
}

if ((data.raw["player"] ~= nil) and (data.raw["player"]["player"] ~= nil)) then
    data.raw["player"]["player"]["animations"] = animations_live
end

if ((data.raw["character"] ~= nil) and (data.raw["character"]["character"] ~= nil)) then
    data.raw["character"]["character"]["animations"] = animations_live
end

if ((data.raw["character-corpse"] ~= nil) and (data.raw["character-corpse"]["character-corpse"] ~= nil)) then
    data.raw["character-corpse"]["character-corpse"]["pictures"] = animations_dead
end

