--[[
LuCI - Lua Configuration Interface

Copyright 2010 John Crispin <blogic@openwrt.org>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

]]--

m = Map("telephony", translate("VoIP"))
m.on_after_commit = function() luci.sys.call("/etc/init.d/telephony reload") end

s = m:section(TypedSection, "contact", translate("Contact"), translate("Here You can specify the SIP contacts that you want to use."))
s.anonymous = true
s.addremove = true
s.template = "cbi/tblsection"

s:option(Value, "number", translate("Number"))
s:option(Value, "identifier", translate("Identifier"))

return m
