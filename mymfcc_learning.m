function learn = mymfcc_learning(speech, fs, framesize, frameshift, nceps)
%MFCC特徴量の抽出

%%この関数は、サンプリング周波数fsの音声サンプルデータspeechを
%%フレーム長framesize、フレームシフトframeshift、次元ncepsでMFCCを求め、
%%その配列を相対度数分布に変換することにより、特徴量を抽出する

%フレームごとのMFCCを配列mfdataにまとめる
current=1;
for n=1:frameshift:length(speech)-framesize
    MFCC=mymfcc(speech,fs,n,n+framesize,nceps);
    mfdata(:,current)=MFCC;
    current=current+1;
end

%次元ごとにMFCCの値を相対度数分布にする
[~,data_len]=size(mfdata);
edges=(-30:0.5:30);
for n=1:nceps
    md=mfdata(n,:);
    hist=(histcounts(md,edges)).*(1/data_len);
    learn(n,:)=hist;
end

end

