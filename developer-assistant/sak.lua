function Survival_ui(event)
    local player = game.players[event.player_index]
    local player_screen = player.gui.screen
    local attr = storage.attr[event.player_index]
    local talent = storage.talent.player[event.player_index]
    UI_close(player, "survival_main_frame")
    local survival_main_frame = player_screen.add {
        type = "frame",
        name = "survival_main_frame",
        direction = "vertical"
    }
    survival_main_frame.style.width = 1280
    survival_main_frame.style.height = 640
    survival_main_frame.location = { 0, 36 }
    local survival_title_table = survival_main_frame.add {
        type = "table",
        name = "survival_title_table",
        column_count = 3
    }
    survival_title_table.style.horizontally_stretchable = true
    survival_title_table.style.column_alignments[1] = "left"
    survival_title_table.style.column_alignments[2] = "left"
    survival_title_table.style.column_alignments[3] = "right"
    survival_title_table.add {
        type = "label",
        name = "survival_title_main",
        caption = { "survival.title01" },
        style = "title_label"
    }
    local dragger = survival_title_table.add { type = "empty-widget", style = "draggable_space" }
    dragger.style.height = 20
    dragger.style.horizontally_stretchable = true
    dragger.drag_target = survival_main_frame
    local close = survival_title_table.add {
        type = "sprite-button",
        name = "survival_close",
        sprite = "utility/close",
        style = "nor_button"
    }
    close.style.width = 28
    close.style.height = 28

    local survival_content_table = survival_main_frame.add {
        type = "table",
        name = "survival_content_table",
        column_count = 2
    }
    survival_content_table.style.column_alignments[1] = "left"
    survival_content_table.style.column_alignments[2] = "right"
    survival_content_table.style.horizontally_stretchable = true
    --left
    local survival_leftcontent_frame = survival_content_table.add {
        type = "frame",
        name = "survival_leftcontent_frame",
        style = "content_deep_frame",
        direction = "vertical"
    }
    local survival_base_table = survival_leftcontent_frame.add {
        type = "table",
        name = "survival_base_table",
        column_count = 2,
    }
    survival_base_table.style.column_alignments[1] = "left"
    survival_base_table.style.column_alignments[2] = "right"
    local survival_lv_table = survival_base_table.add {
        type = "table",
        name = "survival_lv_table",
        column_count = 1,
    }
    survival_lv_table.style.column_alignments[1] = "center"
    local survival_lv_content_table = survival_lv_table.add {
        type = "table",
        name = "survival_lv_content_table",
        column_count = 2,
    }
    survival_lv_content_table.style.column_alignments[1] = "left"
    survival_lv_content_table.style.column_alignments[2] = "center"
    --Level
    local survival_lv_title = survival_lv_content_table.add {
        type = "label",
        name = "survival_lv_title",
        caption = "Lv : ",
        style = "title_label"
    }
    survival_lv_title.style.top_padding = 10
    survival_lv_title.style.left_padding = 10
    survival_lv_title.style.font = "rage-32"
    local survival_lv_value = survival_lv_content_table.add {
        type = "label",
        name = "survival_lv_value",
        caption = attr.lv,
        style = "ui_label"
    }
    survival_lv_title.style.top_padding = 10
    survival_lv_value.style.font = "gibson-bold-20"
    local survival_exp_title = survival_lv_content_table.add {
        type = "label",
        name = "survival_exp_title",
        caption = "exp : ",
        style = "title_label"
    }
    survival_exp_title.style.left_padding = 10
    local survival_exp_bar = survival_lv_content_table.add {
        type = "progressbar",
        name = "survival_exp_bar",
        value = attr.exp / exp_classes(attr.lv),
        style = "progressbar",
    }
    local survival_exp_value = survival_lv_table.add {
        type = "label",
        name = "survival_exp_value",
        caption = attr.exp .. "/" .. exp_classes(attr.lv),
        style = "ui_label"
    }
    local survival_inf_table = survival_base_table.add {
        type = "table",
        name = "survival_inf_table",
        column_count = 1,
    }
    --name
    survival_inf_table.style.column_alignments[1] = "right"
    local survival_name_value = survival_inf_table.add {
        type = "label",
        name = "survival_name_value",
        caption = player.name,
        style = "title_label"
    }
    survival_name_value.style.horizontally_stretchable = true
    survival_name_value.style.font = "gibson-bold-32"
    survival_name_value.style.right_padding = 16
    local survival_job_value = survival_inf_table.add {
        type = "label",
        name = "survival_job_value",
        caption = { "job." .. attr.job },
        style = "ui_label"
    }
    survival_job_value.style.font = "st-xingkai-24"
    survival_job_value.style.right_padding = 16
    local base_line = survival_leftcontent_frame.add {
        type = "line",
        name = "base_line"
    }
    base_line.style.minimal_height = 32
    --attr_01
    local survival_attrbase_table = survival_leftcontent_frame.add {
        type = "table",
        name = "survival_attrbase_table",
        column_count = 3,
    }
    survival_attrbase_table.style.column_alignments[1] = "left"
    survival_attrbase_table.style.column_alignments[2] = "center"
    survival_attrbase_table.style.column_alignments[3] = "right"
    local colors = { COLOR.green, COLOR.blue, COLOR.yellow, COLOR.red, COLOR.orange, COLOR.yellowish_orange, COLOR.sky_blue }
    for _, v in pairs({ "hp", "mp", "vp", "sp", "san", "food", "water" }) do
        local attr_title = survival_attrbase_table.add {
            type = "label",
            name = "survival_attr_title:" .. v,
            caption = { "", { "attr." .. v }, " : " },
            style = "title_label",
            tooltip = { "attr-info." .. v },
        }
        attr_title.style.left_padding = 10
        local attr_bar = survival_attrbase_table.add {
            type = "progressbar",
            name = "survival_attr_bar:" .. v,
            value = 0.5,
            style = "progressbar",
        }
        if v == "hp" then
            attr_bar.value = player.character.health / player.character.max_health
        elseif v == "food" then
            attr_bar.value = attr[v] / storage[v .. "_max"]
        elseif v == "water" then
            attr_bar.value = attr[v] / storage[v .. "_max"]
        else
            attr_bar.value = attr[v] / attr[v .. "_max"]
        end
        attr_bar.style.horizontally_stretchable = true
        attr_bar.style.color = colors[_]
        local attr_value = survival_attrbase_table.add {
            type = "label",
            name = "survival_attr_value:" .. v,
            caption = "123456789/123456789",
            style = "ui_label"
        }
        if v == "hp" then
            attr_value.caption = player.character.health .. "/" .. player.character.max_health
        elseif v == "food" then
            attr_value.caption = attr[v] .. "/" .. storage[v .. "_max"]
        elseif v == "water" then
            attr_value.caption = attr[v] .. "/" .. storage[v .. "_max"]
        else
            attr_value.caption = attr[v] .. "/" .. attr[v .. "_max"]
        end
        attr_value.style.right_padding = 10
    end
    --attr_02
    local attrexp_line = survival_leftcontent_frame.add {
        type = "line",
        name = "attrexp_line"
    }
    attrexp_line.style.minimal_height = 32
    local survival_attrexp_table = survival_leftcontent_frame.add {
        type = "table",
        name = "survival_attrexp_table",
        column_count = 2,
    }
    survival_attrexp_table.style.column_alignments[1] = "right"
    survival_attrexp_table.style.column_alignments[2] = "right"
    local survival_attrl_table = survival_attrexp_table.add {
        type = "table",
        name = "survival_attrl_table",
        column_count = 2,
    }
    survival_attrl_table.style.column_alignments[1] = "left"
    survival_attrl_table.style.column_alignments[2] = "left"
    local survival_attrr_table = survival_attrexp_table.add {
        type = "table",
        name = "survival_attrr_table",
        column_count = 2,
    }
    survival_attrr_table.style.column_alignments[1] = "left"
    survival_attrr_table.style.column_alignments[2] = "left"
    for _, v in pairs({ "cr", "speed", "crafting", }) do
        local attr_title = survival_attrl_table.add {
            type = "label",
            name = "survival_attr_title:" .. v,
            caption = { "", { "attr." .. v }, " : " },
            style = "title_label"
        }
        attr_title.style.left_padding = 10
        attr_title.style.horizontally_stretchable = true
        local attr_value = survival_attrl_table.add {
            type = "label",
            name = "survival_attr_value:" .. v,
            caption = attr[v],
            style = "ui_label"
        }
        attr_value.style.horizontally_stretchable = true
    end
    for _, v in pairs({ "luck", "mining", "slot", }) do
        local attr_title = survival_attrr_table.add {
            type = "label",
            name = "survival_attr_title:" .. v,
            caption = { "", { "attr." .. v }, " : " },
            style = "title_label",
            tooltip = { "attr-info." .. v },
        }
        attr_title.style.left_padding = 10
        attr_title.style.horizontally_stretchable = true
        local attr_value = survival_attrr_table.add {
            type = "label",
            name = "survival_attr_value:" .. v,
            caption = attr[v],
            style = "ui_label",
        }
        attr_value.style.horizontally_stretchable = true
    end
    --attr_03
    local attrele_line = survival_leftcontent_frame.add {
        type = "line",
        name = "attrele_line"
    }
    attrele_line.style.minimal_height = 32
    local survival_attrele_table = survival_leftcontent_frame.add {
        type = "table",
        name = "survival_attrele_table",
        column_count = 12,
    }
    survival_attrele_table.style.left_padding = 8
    for i = 1, 6 do
        survival_attrele_table.style.column_alignments[i] = "center"
    end
    for _, v in pairs({ "blood", "dream", "fire", "icy", "lava", "moon", "mystery", "nature", "poison", "water", "wind", "shadow", }) do
        local survival_attrele_sprite = survival_attrele_table.add {
            type = "sprite-button",
            name = "survival_attrele_sprite:" .. v,
            sprite = v,
            style = "blueprint_record_slot_button",
            tooltip = { "", { "element." .. v }, " : " .. attr["E" .. v] },
        }
        survival_attrele_sprite.style.size = 48
        survival_attrele_sprite.style.horizontally_stretchable = true
        survival_attrele_sprite.style.vertically_stretchable = true
    end

    --right
    local survival_rightcontent_frame = survival_content_table.add {
        type = "frame",
        name = "survival_rightcontent_frame",
        style = "content_deep_frame",
        direction = "vertical"
    }
    local survival_apoint_table = survival_rightcontent_frame.add {
        type = "table",
        name = "survival_apoint_table",
        column_count = 2,
    }
    survival_apoint_table.style.column_alignments[1] = "left"
    survival_apoint_table.style.column_alignments[2] = "right"
    local apoint_title = survival_apoint_table.add {
        type = "label",
        name = "apoint_title",
        caption = "Attr Point:",
        style = "title_label"
    }
    apoint_title.style.top_padding = 8
    apoint_title.style.left_padding = 10
    apoint_title.style.font = "rage-32"
    local apoint_value = survival_apoint_table.add {
        type = "label",
        name = "apoint_value",
        caption = attr.ap,
        style = "ui_label"
    }
    apoint_value.style.top_padding = 8
    apoint_value.style.font = "gibson-bold-20"
    local survival_attrap_table = survival_rightcontent_frame.add {
        type = "table",
        name = "survival_attrap_table",
        column_count = 3,
    }
    survival_attrap_table.style.column_alignments[1] = "left"
    survival_attrap_table.style.column_alignments[2] = "center"
    survival_attrap_table.style.column_alignments[3] = "right"
    for _, v in pairs({ "str", "dex", "int" }) do
        local attrbase_table = survival_attrap_table.add {
            type = "table",
            name = "attrbase_table:" .. v,
            column_count = 3,
        }
        survival_attrexp_table.style.column_alignments[1] = "left"
        survival_attrexp_table.style.column_alignments[2] = "right"
        survival_attrexp_table.style.column_alignments[3] = "right"
        local attr_title = attrbase_table.add {
            type = "label",
            name = "attr_title:" .. v,
            caption = { "", { "attr." .. v }, " : " },
            style = "title_label",
            tooltip = { "attr-info." .. v },
        }
        attr_title.style.font = "infinite"
        attr_title.style.left_padding = 10
        local attr_value = attrbase_table.add {
            type = "label",
            name = "attr_value:" .. v,
            caption = attr[v],
            style = "ui_label"
        }
        local attr_button_table = attrbase_table.add {
            type = "table",
            name = "attr_button_table:" .. v,
            column_count = 1,
        }
        attr_button_table.style.width = 36
        local attr_button = attr_button_table.add {
            type = "sprite-button",
            name = "attr_button:" .. v,
            sprite = "utility/expand",
            style = "nor_button"
        }
        attr_button.style.top_padding = 0
        attr_button.style.top_margin = 0
        attr_button.style.width = 16
        attr_button.style.height = 16
    end
    local survival_attrapl_table = survival_attrap_table.add {
        type = "table",
        name = "survival_attrapl_table",
        column_count = 2,
    }
    survival_attrapl_table.style.column_alignments[1] = "left"
    survival_attrapl_table.style.column_alignments[2] = "right"
    for _, v in pairs({ "str_pct", "str_res", "str_dec", "str_pen" }) do
        local attr_title = survival_attrapl_table.add {
            type = "label",
            name = "attr_title:" .. v,
            caption = { "", { "attr." .. v }, " : " },
            style = "title_label",
            tooltip = { "attr-info." .. v },
        }
        attr_title.style.left_padding = 10
        local attr_value = survival_attrapl_table.add {
            type = "label",
            name = "attr_value:" .. v,
            caption = attr[v],
            style = "ui_label"
        }
        attr_value.style.right_padding = 10
        if _ == 1 then
            attr_value.caption = ioh.formatPercentage(attr[v])
        end
    end
    local survival_attrapc_table = survival_attrap_table.add {
        type = "table",
        name = "survival_attrapc_table",
        column_count = 2,
    }
    survival_attrapc_table.style.column_alignments[1] = "left"
    survival_attrapc_table.style.column_alignments[2] = "right"
    for _, v in pairs({ "dex_pct", "dex_res", "dex_dec", "dex_pen" }) do
        local attr_title = survival_attrapc_table.add {
            type = "label",
            name = "attr_title:" .. v,
            caption = { "", { "attr." .. v }, " : " },
            style = "title_label",
            tooltip = { "attr-info." .. v },
        }
        attr_title.style.left_padding = 10
        local attr_value = survival_attrapc_table.add {
            type = "label",
            name = "attr_value:" .. v,
            caption = attr[v],
            style = "ui_label"
        }
        attr_value.style.right_padding = 10
        if _ == 1 then
            attr_value.caption = ioh.formatPercentage(attr[v])
        end
    end
    local survival_attrapr_table = survival_attrap_table.add {
        type = "table",
        name = "survival_attrapr_table",
        column_count = 2,
    }
    survival_attrapr_table.style.column_alignments[1] = "left"
    survival_attrapr_table.style.column_alignments[2] = "right"
    for _, v in pairs({ "int_pct", "int_res", "int_dec", "int_pen" }) do
        local attr_title = survival_attrapr_table.add {
            type = "label",
            name = "attr_title:" .. v,
            caption = { "", { "attr." .. v }, " : " },
            style = "title_label",
            tooltip = { "attr-info." .. v },
        }
        attr_title.style.left_padding = 10
        local attr_value = survival_attrapr_table.add {
            type = "label",
            name = "attr_value:" .. v,
            caption = attr[v],
            style = "ui_label"
        }
        attr_value.style.right_padding = 10
        if _ == 1 then
            attr_value.caption = ioh.formatPercentage(attr[v])
        end
    end
    local ap_line = survival_rightcontent_frame.add {
        type = "line",
        name = "ap_line"
    }
    ap_line.style.minimal_height = 32
    local survival_skill_bottom_table = survival_rightcontent_frame.add {
        type = "table",
        name = "survival_skill_bottom_table",
        column_count = 2,
    }
    survival_attrexp_table.style.column_alignments[1] = "left"
    survival_attrexp_table.style.column_alignments[2] = "right"
    local survival_content_pane = survival_skill_bottom_table.add {
        type = "scroll-pane",
        name = "survival_content_pane",
        direction = "vertical",
        vertical_scroll_policy = "auto",
        horizontal_scroll_policy = "auto",
    }
    survival_content_pane.style.horizontally_stretchable = true
    survival_content_pane.style.vertically_stretchable = true
    for skill_id, bool in pairs(storage.skill[event.player_index].active) do
        local survival_skill_frame = survival_content_pane.add {
            type = "frame",
            name = "survival_skill_frame:" .. skill_id,
            direction = "vertical"
        }
        survival_skill_frame.style.horizontally_stretchable = true
        local survival_skill_table = survival_skill_frame.add {
            type = "table",
            name = "survival_skill_table:" .. skill_id,
            column_count = 2,
        }
        survival_attrexp_table.style.column_alignments[1] = "left"
        survival_attrexp_table.style.column_alignments[2] = "right"
        local survival_skill_sprite = survival_skill_table.add {
            type = "sprite",
            name = "survival_skill_sprite:" .. skill_id,
            sprite = SKILL[skill_id].sprite
        }
        survival_skill_sprite.style.width = 64
        survival_skill_sprite.style.height = 64
        local survival_skill_label_table = survival_skill_table.add {
            type = "table",
            name = "survival_skill_label_table:" .. skill_id,
            column_count = 1,
        }
        local survival_skill_title = survival_skill_label_table.add {
            type = "label",
            name = "survival_skill_title:" .. skill_id,
            caption = { "skill." .. SKILL[skill_id].name },
            style = "title_label"
        }
        survival_skill_title.style.font = "st-xingkai-24"
        local survival_skill_info = survival_skill_label_table.add {
            type = "label",
            name = "survival_skill_info:" .. skill_id,
            caption = SKILL[skill_id].info,
            style = "ui_label"
        }
        survival_skill_info.style.horizontally_stretchable = true
    end
    local survival_talent_frame = survival_skill_bottom_table.add {
        type = "frame",
        name = "survival_talent_frame",
        style = "content_deep_frame",
        direction = "vertical"
    }
    survival_talent_frame.style.left_padding = 16
    survival_talent_frame.style.right_padding = 16
    survival_talent_frame.style.horizontally_stretchable = false
    survival_talent_frame.style.vertically_stretchable = true
    local survival_talent_sprite = survival_talent_frame.add {
        type = "sprite",
        name = "survival_talent_sprite",
        sprite = "talent-" .. talent.id,
        tooltip = TALENT[talent.id].info(event.player_index),
    }
    survival_talent_sprite.style.width = 144
    survival_talent_sprite.style.height = 256
    local survival_talent_title_table = survival_talent_frame.add {
        type = "table",
        name = "survival_talent_title_table",
        column_count = 1,
    }
    survival_talent_title_table.style.column_alignments[1] = "center"
    local survival_talent_title = survival_talent_title_table.add {
        type = "label",
        name = "survival_talent_title",
        caption = { "talent." .. talent.id },
    }
    survival_talent_title.style.font = "st-xingkai-32"
    survival_talent_title.style.font_color = TALENT[talent.id].color
    survival_talent_title.style.height = 40
    survival_talent_title.style.top_padding = 12
    survival_talent_title.style.horizontally_stretchable = true
    local survival_talent_lv = survival_talent_title_table.add {
        type = "label",
        name = "survival_talent_lv",
        caption = "Lv." .. talent.lv,
    }
    survival_talent_lv.style.font = "gibson-16"
    survival_talent_lv.style.font_color = TALENT[talent.id].color
    survival_talent_lv.style.height = 40
    survival_talent_lv.style.top_padding = 12
    survival_talent_lv.style.horizontally_stretchable = true
end
