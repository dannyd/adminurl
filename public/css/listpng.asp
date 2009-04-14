<!--#include virtual="/htmlfunctions.inc"-->
<div style="background-color: red;">
<%
set objFSO = Server.CreateObject("Scripting.FileSystemObject")

for each f in objFSO.GetFolder("c:\inetpub\ADAdmin_Website\Style\hwinv").Files
'	if right(f.Name,4) = ".png" then
		outbr "<img src=/style/hwinv/" & f.Name & ">&nbsp;&nbsp;&nbsp;&nbsp;" & f.Name & "<br>"
'	end if
next
%>
</div>
