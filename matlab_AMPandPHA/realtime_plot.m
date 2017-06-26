%MIT License

%Copyright (c) 2017 Chao Cai caichao08@gmail.com

%Permission is hereby granted, free of charge, to any person obtaining a copy
%of this software and associated documentation files (the "Software"), to deal
%in the Software without restriction, including without limitation the rights
%to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%copies of the Software, and to permit persons to whom the Software is
%furnished to do so, subject to the following conditions:

%The above copyright notice and this permission notice shall be included in all
%copies or substantial portions of the Software.

%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%SOFTWARE.

clc;clear all;
close all;
close all hidden;
%about tcp protocol
% the following buffer size related to two Tx antennas, if there is only one Tx antenna, this should be 213+2
bufferLen = 213+2;%393+2; 
echotcpip('on',12345)
TCPServer = tcpip('localhost',12345);
%set(TCPServer,'Terminator','#');
fopen(TCPServer);

%intel 5300 is a wifi adapter with 40MHz channel support and 116 subcarier
carrier_frequency = 5.32*10^9;%2.437*10^9
channel_space = 40*10^6/30;
antenna_space = 0.225;

sub_freq_delta = channel_space;
wrapped_packet_number = 2;
total_pks = [];
 while(1)
     nBytes = get(TCPServer,'BytesAvailable');
     if nBytes >= bufferLen
%              disp('read bytes ');disp(nBytes);
          break;
     end
 end
 i = i + 1;

 x = linspace(1+i*N,N+i*N,N);

 data = fread(TCPServer,10);
 disp(data)
 disp(length(data))
 flushinput(TCPServer);
 data = data(4:length(data));
 disp(length(data))
 if length(data) == 392  % this means that we receive a valid package, if not parse the package will enconter error
     % here we use another way to plot the data
%          disp('valide data');
     d = uint8(data);
     csi = read_bfee(d);

%% To do something here
 end

 
fclose(TCPServer);
disp('server closed');
