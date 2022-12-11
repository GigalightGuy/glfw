project "GLFW"
	kind "StaticLib"
	language "C"
    systemversion "latest"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",

        "src/glfw_config.h",

        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/platform.c",
        "src/vulkan.c",
        "src/window.c",

        "src/egl_context.c",
        "src/osmesa_context.c",

        "src/null_init.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_joystick.c"
	}

    filter "system:windows"

        files
        {
            "src/win32_module.c",
            "src/win32_time.c",
            "src/win32_thread.c",

            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_window.c",
            "src/wgl_context.c"
        }

        defines
        {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter "system:linux"

        files
        {
            "posix_module.c",
            "posix_time.c",
            "posix_thread.c",
            "x11_init.c",
            "x11_monitor.c",
            "x11_window.c",
            "xkb_unicode.c",
            "glx_context.c"
        }

        defines
        {
            "_GLFW_X11"
        }

	filter "configurations:Debug"
        runtime "Debug"
		symbols "on"

	filter "configurations:Release"
        runtime "Release"
		optimize "on"

	filter "configurations:Dist"
        runtime "Release"
		optimize "on"