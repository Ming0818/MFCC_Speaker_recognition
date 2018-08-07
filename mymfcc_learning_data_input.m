%複数の人物の音声データを学習データとして登録する

 %実装方法
 %(1)学習データに使用するwavファイルの名前を入力していく ex) a1='vswomen1.wav';
 %(2)コマンドウィンドウでlearn=[]を実行し、learnの値をリセットしておく
 %(3)audioreadの引数に学習データのa1を入力し、ｎ=1としプログラム実行する
 %(4)(3)をa2,n=2で再度実行する
 %(5)登録したデータの数まで(4)のように数値を一つずつ増やして実行していく

 %Fs, nceps, framesize, frameshiftはmymfcc_recognition.mと一緒にする

%学習データ
%ファイル名の先頭のvkが「こんにちは」、vsが「さようなら」
%それにつづくwomenが女性1～5,menが男性1～5
%その後に_2とついてるものが識別用のデータ(mymfcc_recognition.mで使う)
a1='vkwomen1.wav';
a2='vkwomen2.wav';
a3='vkwomen3.wav';
a4='vkwomen4.wav';
a5='vkwomen5.wav';
a6='vkmen1.wav';
a7='vkmen2.wav';
a8='vkmen3.wav';
a9='vkmen4.wav';
a10='vkmen5.wav';

%音声データをひとつずつ読み取る
[y, fs] = audioread(a10);
n=10; %データに合わせてひとつずつ増やしていく

%リサンプル
Fs=16000; %サンプリング周波数
y = resample(y,Fs,fs);

nceps=12; %MFCCの次数

framesize=500; %フレーム長
frameshift=100; %フレームシフト

%MFCC特徴量を登録
learn(:,:,n)=mymfcc_learning(y,Fs,framesize,frameshift,nceps);

