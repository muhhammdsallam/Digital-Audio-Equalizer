%----------------------------AUDIO EQUALIZER---------------------------------
flag=0;
%Take file name from the user
prompt = 'Please enter the file name: ';
x = input(prompt,'s');
[y,Fs]=audioread(x);

disp('----------------------------------------');

%Get gain from the user
disp('Please enter the gain:');
g1 = input('enter gain 1 (0-170 Hz): ');
g2 = input('enter gain 2 (170-310 Hz): ');
g3 = input('enter gain 3 (310-600 Hz): ');
g4 = input('enter gain 4 (600-1000 Hz): ');
g5 = input('enter gain 5 (1-3 KHz): ');
g6 = input('enter gain 6 (3-6 KHz): ');
g7 = input('enter gain 7 (6-12 KHz): ');
g8 = input('enter gain 8 (12-14 KHz): ');
g9 = input('enter gain 9 (14-16 KHz): ');

disp('----------------------------------------');

%Get sample rate from the user
 Fstest= input('Enter the output Sample Rate: ');
 if Fstest > 32000
     Fsout=Fstest;
 else
     Fsout=34000;
     flag=1;
 end
disp('----------------------------------------');
fm=Fsout/2;

%Get type of filter from the user
while(1)
    disp('Choose the type of filter: ');
    disp('1)IIR Filter          2)FIR Filter');
    filterType = input('Please Enter your choice: ');

    disp('----------------------------------------');

    switch filterType
    case 1
        N = 2;
       %-----------------------------IIR Filters---------------------------
       %                 -----------(0-170 Hz)------------
        Wc1  = 170/(fm);                     % normalize the cutoff frequency
        [num1,den1] = butter(N,Wc1);         % get the num and den
        [z1,p1,k1] = butter(N,Wc1);          % get zeros , poles , gain
        transferFunc1=tf(num1,den1);         % get the transfer function
        [H1,w1] = freqz(num1,den1);          % compute the frequency response
        mag1 = abs(H1);                      % compute the magnitude
        phase1 = angle(H1)*180/pi;           % compute the phase
%                            -------Plotting------
        subplot(4,1,1);plot(w1/pi,mag1);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w1/pi,phase1);grid;xlim([0 0.1]);title('Phase');
        subplot(4,1,3);stem(impulse(transferFunc1));grid;title('Impulse Response');
        subplot(4,1,4);stem(step(transferFunc1));grid;title('Step Response');
        suptitle('0-170 Hz');
        figure; pzmap(transferFunc1);title('Zeros and poles of (0-170 Hz)');

        %            ------------(170-310 Hz)---------------
        Wc21=170;
        Wc22=310;
        Wc2  = [Wc21 Wc22]/(fm);                     % normalize the cutoff frequency
        [num2,den2] = butter(N,Wc2);                 % get the num and den
        [z2,p2,k2] = butter(N,Wc2);                  % get zeros , poles , gain
        transferFunc2=tf(num2,den2);                 % get the transfer function
        [H2,w2] = freqz(num2,den2);                  % compute the frequency response
        mag2 = abs(H2);                              % compute the magnitude
        phase2 = angle(H2)*180/pi;                   % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w2/pi,mag2);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w2/pi,phase2);grid;xlim([0 0.1]);title('Phase');
        subplot(4,1,3);stem(impulse(transferFunc2));grid;title('Impulse Response');
        subplot(4,1,4);stem(step(transferFunc2));grid;title('Step Response');
        suptitle('170-310 Hz');
        figure; pzmap(transferFunc2);title('Zeros and poles of (170-310 Hz)');

        %            --------------(310-600 Hz)---------------
        Wc31=310;
        Wc32=600;
        Wc3  = [Wc31 Wc32]/(fm);                     % normalize the cutoff frequency
        [num3,den3] = butter(N,Wc3);                 % get the num and den
        [z3,p3,k3] = butter(N,Wc3);                  % get zeros , poles , gain
        transferFunc3=tf(num3,den3);                 % get the transfer function
        [H3,w3] = freqz(num3,den3);                  % compute the frequency response
        mag3 = abs(H3);                              % compute the magnitude
        phase3 = angle(H3)*180/pi;                   % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w3/pi,mag3);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w3/pi,phase3);grid;xlim([0 0.1]);title('Phase');
        subplot(4,1,3);stem(impulse(transferFunc3));grid;title('Impulse Response');
        subplot(4,1,4);stem(step(transferFunc3));grid;title('Step Response');
        suptitle('310-600 Hz');
        figure; pzmap(transferFunc3);title('Zeros and poles of (310-600 Hz)');

        %           --------------(600-1000 Hz)---------------
        Wc41=600;
        Wc42=1000;
        Wc4 = [Wc41 Wc42]/(fm);                     % normalize the cutoff frequency
        [num4,den4] = butter(N,Wc4);                % get the num and den
        [z4,p4,k4] = butter(N,Wc4);                 % get zeros , poles , gain
        transferFunc4=tf(num4,den4);                % get the transfer function
        [H4,w4] = freqz(num4,den4);                 % compute the frequency response
        mag4 = abs(H4);                             % compute the magnitude
        phase4 = angle(H4)*180/pi;                  % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w4/pi,mag4);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w4/pi,phase4);grid;xlim([0 0.1]);title('Phase');
        subplot(4,1,3);stem(impulse(transferFunc4));grid;title('Impulse Response');
        subplot(4,1,4);stem(step(transferFunc4));grid;title('Step Response');
        suptitle('600-1000 Hz');
        figure; pzmap(transferFunc4);title('Zeros and poles of (600-1000 Hz)');


        %          --------------(1000-3000 Hz)---------------
        Wc51=1000;
        Wc52=3000;
        Wc5= [Wc51 Wc52]/(fm);                     % normalize the cutoff frequency
        [num5,den5] = butter(N,Wc5);               % get the num and den
        [z5,p5,k5] = butter(N,Wc5);                % get zeros , poles , gain
        transferFunc5=tf(num5,den5);               % get the transfer function
        [H5,w5] = freqz(num5,den5);                % compute the frequency response
        mag5 = abs(H5);                            % compute the magniutde
        phase5 = angle(H5)*180/pi;                 % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w5/pi,mag5);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w5/pi,phase5);grid;xlim([0 0.1]);title('Phase');
        subplot(4,1,3);stem(impulse(transferFunc5));grid;title('Impulse Response');
        subplot(4,1,4);stem(step(transferFunc5));grid;title('Step Response');
        suptitle('1000-3000 Hz');
        figure; pzmap(transferFunc5);title('Zeros and poles of (1000-3000 Hz)');

        %          --------------(3000-6000 Hz)---------------
        Wc61=3000;
        Wc62=6000;
        Wc6= [Wc61 Wc62]/(fm);                     % normalize the cutoff frequency
        [num6,den6] = butter(N,Wc6);               % get the num and den
        [z6,p6,k6] = butter(N,Wc6);                % get zeros , poles , gain
        transferFunc6=tf(num6,den6);               % get the transfer function
        [H6,w6] = freqz(num6,den6);                % compute the frequency response
        mag6 = abs(H6);                            % compute the magnitude
        phase6 = angle(H6)*180/pi;                 % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w6/pi,mag6);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w6/pi,phase6);grid;xlim([0 0.1]);title('Phase');
        subplot(4,1,3);stem(impulse(transferFunc6));grid;title('Impulse Response');
        subplot(4,1,4);stem(step(transferFunc6));grid;title('Step Response');
        suptitle('3000-6000 Hz');
        figure; pzmap(transferFunc6);title('Zeros and poles of (3000-6000 Hz)');

        %------------(6000-12000 Hz)---------------
        Wc71=6000;
        Wc72=12000;
        Wc7= [Wc71 Wc72]/(fm);                     % normalize the cutoff frequency
        [num7,den7] = butter(N,Wc7);               % get the num and den
        [z7,p7,k7] = butter(N,Wc7);                % get zeros , poles , gain
        transferFunc7=tf(num7,den7);               % get the transfer function
        [H7,w7] = freqz(num7,den7);                % compute the frequency response
        mag7 = abs(H7);                            % compute the magnitude
        phase7 = angle(H7)*180/pi;                 % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w7/pi,mag7);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w7/pi,phase7);grid;xlim([0 0.1]);title('Phase');
        subplot(4,1,3);stem(impulse(transferFunc7));grid;title('Impulse Response');
        subplot(4,1,4);stem(step(transferFunc7));grid;title('Step Response');
        suptitle('6000-12000 Hz');
        figure; pzmap(transferFunc7);title('Zeros and poles of (6000-12000 Hz)');

        %         --------------(12000-14000 Hz)---------------
        Wc81=12000;
        Wc82=14000;
        Wc8= [Wc81 Wc82]/(fm);                     % normalize the cutoff frequency
        [num8,den8] = butter(N,Wc8);               % get the num and den
        [z8,p8,k8] = butter(N,Wc8);                % get zeros , poles , gain
        transferFunc8=tf(num8,den8);               % get the transfer function
        [H8,w8] = freqz(num8,den8);                % compute the frequency response
        mag8 = abs(H8);                            % compute the magnitude
        phase8 = angle(H8)*180/pi;                 % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w8/pi,mag8);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w8/pi,phase8);grid;xlim([0 0.1]);title('Phase');
        subplot(4,1,3);stem(impulse(transferFunc8));grid;title('Impulse Response');
        subplot(4,1,4);stem(step(transferFunc8));grid;title('Step Response');
        suptitle('12000-14000 Hz');
        figure; pzmap(transferFunc8);title('Zeros and poles of (12000-14000 Hz)');

        %           -------------(14000-16000 Hz)---------------
        Wc91=14000;
        Wc92=16000;
        Wc9= [Wc91 Wc92]/(fm);                     % normalize the cutoff frequency
        [num9,den9] = butter(N,Wc9);               % get the num and den
        [z9,p9,k9] = butter(N,Wc9);                % get zeros , poles , gain
        transferFunc9=tf(num9,den9);               % get the transfer function
        [H9,w9] = freqz(num9,den9);                % compute the frequency response
        mag9 = abs(H9);                            % compute the magnitude
        phase9 = angle(H9)*180/pi;                 % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w9/pi,mag9);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w9/pi,phase9);grid;xlim([0 0.1]);title('Phase');
       subplot(4,1,3);stem(impulse(transferFunc9));grid;title('Impulse Response');
        subplot(4,1,4);stem(step(transferFunc9));grid;title('Step Response');
        suptitle('14000-16000 Hz');
        figure; pzmap(transferFunc9);title('Zeros and poles of (14000-16000 Hz)');

        break;
    case 2
        N = 300;
        %----------------------FIR Filters-----------------------------
        %         -------------(0-170 Hz)--------------
        Wc1=170/fm;
        num1=fir1(N,Wc1);                    % get the numerator
        den1=1;
        transferFunc1=tf(num1,den1);         % get the transfer function
        [H1,w1] = freqz(num1,den1);          % compute the frequency response
        [H12,t11]=impz(num1,den1);           % compute impulse response
        [H13,t12]=stepz(num1,den1);          % compute step response
        mag1 = abs(H1);                      % compute the magnitude
        phase1 = angle(H1)*180/pi;           % compute the phase
%                            -------Plotting------
        subplot(4,1,1);plot(w1/pi,mag1);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w1/pi,phase1);grid;xlim([0 1]);title('Phase');
        subplot(4,1,3);stem(t11,H12);grid;title('Impulse Response');
        subplot(4,1,4);stem(t12,H13);grid;title('Step Response');
        suptitle('0-170 Hz');
        figure; pzmap(transferFunc1);title('Zeros and poles of (0-170 Hz)');

        %----------(170-310 Hz)--------------
        Wc21=170;
        Wc22=310;
        Wc2=[Wc21 Wc22]/fm;
        num2=fir1(N,Wc2);                    % get the numerator
        den2=1;
        transferFunc2=tf(num2,den2);         % get the transfer function
        [H2,w2] = freqz(num2,den2);          % compute the frequency response
        [H22,t21]=impz(num2,den2);           % compute impulse response
        [H23,t22]=stepz(num2,den2);          % compute step response
        mag2 = abs(H2);                      % compute the magnitude
        phase2 = angle(H2)*180/pi;           % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w2/pi,mag2);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w2/pi,phase2);grid;xlim([0 1]);title('Phase');
        subplot(4,1,3);stem(t21,H22);grid;title('Impulse Response');
        subplot(4,1,4);stem(t22,H23);grid;title('Step Response');
        suptitle('170-310 Hz');
        figure; pzmap(transferFunc2);title('Zeros and poles of (170-310 Hz)');

        %           -------------(310-600 Hz)--------------
        Wc31=310;
        Wc32=600;
        Wc3=[Wc31 Wc32]/fm;
        num3=fir1(N,Wc3);                    % get the numerator
        den3=1;
        transferFunc3=tf(num3,den3);         % get the transfer function
        [H3,w3] = freqz(num3,den3);          % compute the frequency response
        [H32,t31]=impz(num3,den3);           % compute impulse response
        [H33,t32]=stepz(num3,den3);          % compute step response
        mag3 = abs(H3);                      % compute the magnitude
        phase3 = angle(H3)*180/pi;           % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w3/pi,mag3);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w3/pi,phase3);grid;xlim([0 1]);title('Phase');
        subplot(4,1,3);stem(t31,H32);grid;title('Impulse Response');
        subplot(4,1,4);stem(t32,H33);grid;title('Step Response');
        suptitle('310-600 Hz');
        figure; pzmap(transferFunc3);title('Zeros and poles of (310-600 Hz)');

        %          ------------(600-1000 Hz)--------------
        Wc41=600;
        Wc42=1000;
        Wc4=[Wc41 Wc42]/fm;
        num4=fir1(N,Wc4);                   % get the numerator
        den4=1;
        transferFunc4=tf(num4,den4);        % get the transfer function
        [H4,w4] = freqz(num4,den4);         % compute the frequency response
        [H42,t41]=impz(num4,den4);          % compute impulse response
        [H43,t42]=stepz(num4,den4);         % compute step response
        mag4 = abs(H4);                     % compute the magnitude
        phase4 = angle(H4)*180/pi;          % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w4/pi,mag4);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w4/pi,phase4);grid;xlim([0 1]);title('Phase');
        subplot(4,1,3);stem(t41,H42);grid;title('Impulse Response');
        subplot(4,1,4);stem(t42,H43);grid;title('Step Response');
        suptitle('600-1000 Hz');
        figure; pzmap(transferFunc4);title('Zeros and poles of (600-1000 Hz)');

        %            -------------(1000-3000 Hz)--------------
        Wc51=1000;
        Wc52=3000;
        Wc5=[Wc51 Wc52]/fm;
        num5=fir1(N,Wc5);                   % get the numerator
        den5=1;
        transferFunc5=tf(num5,den5);        % get the transfer function
        [H5,w5] = freqz(num5,den5);         % compute the frequency response
        [H52,t51]=impz(num5,den5);          % compute impulse response
        [H53,t52]=stepz(num5,den5);         % compute step response
        mag5 = abs(H5);                     % compute the magnitude
        phase5 = angle(H5)*180/pi;          % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w5/pi,mag5);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w5/pi,phase5);grid;xlim([0 1]);title('Phase');
        subplot(4,1,3);stem(t51,H52);grid;title('Impulse Response');
        subplot(4,1,4);stem(t52,H53);grid;title('Step Response');
        suptitle('1000-3000 Hz');
        figure; pzmap(transferFunc5);title('Zeros and poles of (1000-3000 Hz)');

        %           -------------(3000-6000 Hz)--------------
        Wc61=3000;
        Wc62=6000;
        Wc6=[Wc61 Wc62]/fm;
        num6=fir1(N,Wc6);                   % get the numerator
        den6=1;
        transferFunc6=tf(num6,den6);        % get the transfer function
        [H6,w6] = freqz(num6,den6);         % compute the frequency response
        [H62,t61]=impz(num6,den6);          % compute impulse response
        [H63,t62]=stepz(num6,den6);         % compute step response
        mag6 = abs(H6);                     % compute the magnitude
        phase6 = angle(H6)*180/pi;          % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w6/pi,mag6);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w6/pi,phase6);grid;xlim([0 1]);title('Phase');
        subplot(4,1,3);stem(t61,H62);grid;title('Impulse Response');
        subplot(4,1,4);stem(t62,H63);grid;title('Step Response');
        suptitle('3000-6000 Hz');
        figure; pzmap(transferFunc6);title('Zeros and poles of (3000-6000 Hz)');

        %           -------------(6000-12000 Hz)--------------
        Wc71=6000;
        Wc72=12000;
        Wc7=[Wc71 Wc72]/fm;
        num7=fir1(N,Wc7);                   % get the numerator
        den7=1;
        transferFunc7=tf(num7,den7);        % get the transfer function
        [H7,w7] = freqz(num7,den7);         % compute the frequency response
        [H72,t71]=impz(num7,den7);          % compute impulse response
        [H73,t72]=stepz(num7,den7);         % compute step response
        mag7 = abs(H7);                     % compute the magnitude
        phase7 = angle(H7)*180/pi;          % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w7/pi,mag7);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w7/pi,phase7);grid;xlim([0 1]);title('Phase');
        subplot(4,1,3);stem(t71,H72);grid;title('Impulse Response');
        subplot(4,1,4);stem(t72,H73);grid;title('Step Response');
        suptitle('6000-12000 Hz');
        figure; pzmap(transferFunc7);title('Zeros and poles of (6000-12000 Hz)');

        %           -------------(12000-14000 Hz)--------------
        Wc81=12000;
        Wc82=14000;
        Wc8=[Wc81 Wc82]/fm;
        num8=fir1(N,Wc8);                   % get the numerator
        den8=1;
        transferFunc8=tf(num8,den8);        % get the transfer function
        [H8,w8] = freqz(num8,den8);         % compute the frequency response
        [H82,t81]=impz(num8,den8);          % compute impulse response
        [H83,t82]=stepz(num8,den8);         % compute step response
        mag8 = abs(H8);                     % compute the magnitude
        phase8 = angle(H8)*180/pi;          % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w8/pi,mag8);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w8/pi,phase8);grid;xlim([0 1]);title('Phase');
        subplot(4,1,3);stem(t81,H82);grid;title('Impulse Response');
        subplot(4,1,4);stem(t82,H83);grid;title('Step Response');
        suptitle('12000-14000 Hz');
        figure; pzmap(transferFunc8);title('Zeros and poles of (12000-14000 Hz)');

        %           -------------(14000-16000 Hz)--------------
        Wc91=14000;
        Wc92=16000;
        Wc9=[Wc91 Wc92]/fm;
        num9=fir1(N,Wc9);                   % get the numerator
        den9=1;
        transferFunc9=tf(num9,den9);        % get the transfer function
        [H9,w9] = freqz(num9,den9);         % compute the frequency response
        [H92,t91]=impz(num9,den9);          % compute impulse response
        [H93,t92]=stepz(num9,den9);         % compute step response
        mag9 = abs(H9);                     % compute the magnitude
        phase9 = angle(H9)*180/pi;          % compute the phase
%                            -------Plotting------
        figure;
        subplot(4,1,1);plot(w9/pi,mag9);grid;xlim([0 1]);title('Magnitude');
        subplot(4,1,2);plot(w9/pi,phase9);grid;xlim([0 1]);title('Phase');
        subplot(4,1,3);stem(t91,H92);grid;title('Impulse Response');
        subplot(4,1,4);stem(t92,H93);grid;title('Step Response');
        suptitle('14000-16000 Hz');
        figure; pzmap(transferFunc9);title('Zeros and poles of (14000-16000 Hz)');

        break;
        otherwise
            disp('ERROR! PLEASE ENTER CORRECT NUMBER');
    end
end

%Filtering the input sound
g1 = db2mag(g1);
f1=g1*filter(num1,den1,y);
F1=real(fft(f1));

g2 = db2mag(g2);
f2=g2*filter(num2,den2,y);
F2=real(fft(f2));

g3 = db2mag(g3);
f3=g3*filter(num3,den3,y);
F3=real(fft(f3));

g4 = db2mag(g4);
f4=g4*filter(num4,den4,y);
F4=real(fft(f4));

g5 = db2mag(g5);
f5=g5*filter(num5,den5,y);
F5=real(fft(f5));

g6 = db2mag(g6);
f6=g6*filter(num6,den6,y);
F6=real(fft(f6));

g7 = db2mag(g7);
f7=g7*filter(num7,den7,y);
F7=real(fft(f7));

g8 = db2mag(g8);
f8=g8*filter(num8,den8,y);
F8=real(fft(f8));

g9 = db2mag(g9);
f9=g9*filter(num9,den9,y);
F9=real(fft(f9));

%plotting output signal from filter(0-170)
figure;
subplot(2,1,1);plot(f1);grid;
title('Filtered signal in time domain');
subplot(2,1,2);plot(F1);grid;
title('Filtered signal in frequency domain');
suptitle('0- 170 Hz');

%plotting output signal from filter(170-310)
figure;
subplot(2,1,1);plot(f2);grid;
title('Filtered signal in time domain');
subplot(2,1,2);plot(F2);grid;
title('Filtered signal in frequency domain');
suptitle('170- 310 Hz');

%plotting output signal from filter(310-600)
figure;
subplot(2,1,1);plot(f3);grid;
title('Filtered signal in time domain');
subplot(2,1,2);plot(F3);grid;
title('Filtered signal in frequency domain');
suptitle('310- 600 Hz');

%plotting output signal from filter(600-1000)
figure;
subplot(2,1,1);plot(f4);grid;
title('Filtered signal in time domain');
subplot(2,1,2);plot(F4);grid;
title('Filtered signal in frequency domain');
suptitle('600- 1000 Hz');

%plotting output signal from filter(1000-3000)
figure;
subplot(2,1,1);plot(f5);grid;
title('Filtered signal in time domain');
subplot(2,1,2);plot(F5);grid;
title('Filtered signal in frequency domain');
suptitle('1000- 3000 Hz');

%plotting output signal from filter(3000-6000)
figure;
subplot(2,1,1);plot(f6);grid;
title('Filtered signal in time domain');
subplot(2,1,2);plot(F6);grid;
title('Filtered signal in frequency domain');
suptitle('3000- 6000 Hz');

%plotting output signal from filter(6000-12000)
figure;
subplot(2,1,1);plot(f7);grid;
title('Filtered signal in time domain');
subplot(2,1,2);plot(F7);grid;
title('Filtered signal in frequency domain');
suptitle('6000- 12000 Hz');

%plotting output signal from filter(12000-14000)
figure;
subplot(2,1,1);plot(f8);grid;
title('Filtered signal in time domain');
subplot(2,1,2);plot(F8);grid;
title('Filtered signal in frequency domain');
suptitle('12000- 14000 Hz');

%plotting output signal from filter(14000-16000)
figure;
subplot(2,1,1);plot(f9);grid;
title('Filtered signal in time domain');
subplot(2,1,2);plot(F9);grid;
title('Filtered signal in frequency domain');
suptitle('14000- 16000 Hz');

ftotal=f1+f2+f3+f4+f5+f6+f7+f8+f9;
Ftotal=real(fft(ftotal));
Y=real(fft(y));

%plotting output signal VS original signal
figure;
subplot(2,2,1);plot(y,'b');grid;
title('Original signal in time domain');
subplot(2,2,2);plot(Y,'b');grid;
title('Original signal in frequency domain');
subplot(2,2,3);plot(ftotal,'r');grid;
title('Filtered signal in time domain');
subplot(2,2,4);plot(Ftotal,'r');grid;
title('Filtered signal in frequency domain');
suptitle('Composite Signal VS Original Signal');

if flag==1
    Fsout=Fstest;
end
sound(ftotal,Fsout);
