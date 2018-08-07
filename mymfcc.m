function mfcc = mymfcc(speech, fs, frame_start, frame_end, nceps)
%MFCC

%%この関数は、サンプリング周波数fsの音声サンプルデータspeechの
%%frame_startからframe_endまでの区間の次数ncepsのMFCCを求める

%メルフィルタバンクの設計を行う
m=40; %バンド数
n=512; %fftの点数
maxmel=hz2mel(fs/2);
mstep=maxmel/(m+1);
h=round(mel2hz(0:mstep:maxmel)/(fs/2)*(n/2))+1;
H=zeros(m,n/2+1);
for idx=1:length(h)-2
    c1=h(idx); c2=h(idx+1); c3=h(idx+2);
    H(idx,c1:c2)=linspace(0,1,c2-c1+1);
    H(idx,c2:c3)=linspace(1,0,c3-c2+1);
    H(idx,:)=H(idx,:)/sum(H(idx,:)); %正規化
end

%音声データのフレーム部分を切り取る
Y=speech(frame_start:frame_end);

%高域強調とハン窓を適用し、データを扱いやすい形にする
Y_fil = filter([1 -0.97],1,Y);
Y_fil_win = Y_fil.*hann(frame_end-frame_start+1);

%離散フーリエ変換を行う
S=fft(Y_fil_win,n);

%周波数スペクトルSの絶対値を２乗し、パワースペクトルを得る
%メルフィルタバンクを適用する
LS=H*abs(S(1:257)).^2;

%離散コサイン変換を行う
ceps=dct(log(LS));

%nceps次元のMFCCを求める
mfcc=ceps(1:nceps);
end