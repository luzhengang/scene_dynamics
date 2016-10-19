% findingSerialPort.m
port = 0;
s = instrhwinfo ('serial');
for p = 1:length(s.AvailableSerialPorts)
    if (strfind (s.AvailableSerialPorts{p}, ...
            '/dev/tty.usbserial-') == 1)
        port = s.AvailableSerialPorts{p};
        disp(port);
        break
    end
end
if (~ port)
    error ('Can''t find Cedrus response box');
end