%登録された学習データからある人物の音声データと同一人物を識別する
 
 %実装方法
 %(1)mymfcc_learning_data_input.mで、学習データを複数登録しておく
 %(2)登録した学習データの数を入力する
 %(3)audioreadの引数に識別の音声データを入力し、プログラム実行する
 
 %Fs, nceps, framesize, frameshiftはmymfcc_learning_data_input.mと一緒にする

%学習データの数
n=10;

%識別を行う音声データを読み込む
[Y, fs] = audioread('vkwomen2_2.wav');

%リサンプル
Fs=16000; %サンプリング周波数
Y = resample(Y,Fs,fs);

nceps=12; %MFCCの次数

framesize=500; %フレーム長
frameshift=100; %フレームシフト

%識別データのMFCC特徴量を抽出する
target=mymfcc_learning(Y,Fs,framesize,frameshift,nceps);

%学習データと識別データの特徴量の差を登録する
diff=[];
for data=1:n
    diff(:,:,data)=learn(:,:,data)-target; %差を計算
end

%学習データの中で識別データとの特徴量の差が最小なものを見つけ配列に登録する
diff=abs(diff); %差の絶対値をとる
[C,I]=min(diff,[],3); %差の最小値とそのインデックス
I(C<=0)=NaN; %差の最小値が０のものは使用しないので、NaNにする

%学習データと識別データの一致率を算出する
rec=[];
for data=1:n
    rec(data)=length(I(I==data));
end
rate=rec.*(1/sum(rec));
r=round(rate,2,'significant') %有効数字2桁
