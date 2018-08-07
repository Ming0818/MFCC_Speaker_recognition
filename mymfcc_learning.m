function learn = mymfcc_learning(speech, fs, framesize, frameshift, nceps)
%MFCC�����ʂ̒��o

%%���̊֐��́A�T���v�����O���g��fs�̉����T���v���f�[�^speech��
%%�t���[����framesize�A�t���[���V�t�gframeshift�A����nceps��MFCC�����߁A
%%���̔z��𑊑Γx�����z�ɕϊ����邱�Ƃɂ��A�����ʂ𒊏o����

%�t���[�����Ƃ�MFCC��z��mfdata�ɂ܂Ƃ߂�
current=1;
for n=1:frameshift:length(speech)-framesize
    MFCC=mymfcc(speech,fs,n,n+framesize,nceps);
    mfdata(:,current)=MFCC;
    current=current+1;
end

%�������Ƃ�MFCC�̒l�𑊑Γx�����z�ɂ���
[~,data_len]=size(mfdata);
edges=(-30:0.5:30);
for n=1:nceps
    md=mfdata(n,:);
    hist=(histcounts(md,edges)).*(1/data_len);
    learn(n,:)=hist;
end

end

