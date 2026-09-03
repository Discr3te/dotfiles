local function get_hostname()
	local handle = io.popen("hostnamectl hostname", "r")
	if handle == nil or handle == "" then
		hl.notification.create({
			text = "Hostname error",
			timeout = 250,
			icon = "warning",
		})
		return 0
	end
	local hostname = handle:read("*a"):gsub("\n$", "")
	handle:close()
	return hostname
end

HOSTNAME = get_hostname()
