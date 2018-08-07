function mfcc = mymfcc(speech, fs, frame_start, frame_end, nceps)
%MFCC

%%���̊֐��́A�T���v�����O���g��fs�̉����T���v���f�[�^speech��
%%frame_start����frame_end�܂ł̋�Ԃ̎���nceps��MFCC�����߂�

%�����t�B���^�o���N�̐݌v���s��
m=40; %�o���h��
n=512; %fft�̓_��
maxmel=hz2mel(fs/2);
mstep=maxmel/(m+1);
h=round(mel2hz(0:mstep:maxmel)/(fs/2)*(n/2))+1;
H=zeros(m,n/2+1);
for idx=1:length(h)-2
    c1=h(idx); c2=h(idx+1); c3=h(idx+2);
    H(idx,c1:c2)=linspace(0,1,c2-c1+1);
    H(idx,c2:c3)=linspace(1,0,c3-c2+1);
    H(idx,:)=H(idx,:)/sum(H(idx,:)); %���K��
end

%�����f�[�^�̃t���[��������؂���
Y=speech(frame_start:frame_end);

%���拭���ƃn������K�p���A�f�[�^�������₷���`�ɂ���
Y_fil = filter([1 -0.97],1,Y);
Y_fil_win = Y_fil.*hann(frame_end-frame_start+1);

%���U�t�[���G�ϊ����s��
S=fft(Y_fil_win,n);

%���g���X�y�N�g��S�̐�Βl���Q�悵�A�p���[�X�y�N�g���𓾂�
%�����t�B���^�o���N��K�p����
LS=H*abs(S(1:257)).^2;

%���U�R�T�C���ϊ����s��
ceps=dct(log(LS));

%nceps������MFCC�����߂�
mfcc=ceps(1:nceps);
end