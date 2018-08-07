%�o�^���ꂽ�w�K�f�[�^���炠��l���̉����f�[�^�Ɠ���l�������ʂ���
 
 %�������@
 %(1)mymfcc_learning_data_input.m�ŁA�w�K�f�[�^�𕡐��o�^���Ă���
 %(2)�o�^�����w�K�f�[�^�̐�����͂���
 %(3)audioread�̈����Ɏ��ʂ̉����f�[�^����͂��A�v���O�������s����
 
 %Fs, nceps, framesize, frameshift��mymfcc_learning_data_input.m�ƈꏏ�ɂ���

%�w�K�f�[�^�̐�
n=10;

%���ʂ��s�������f�[�^��ǂݍ���
[Y, fs] = audioread('vkwomen2_2.wav');

%���T���v��
Fs=16000; %�T���v�����O���g��
Y = resample(Y,Fs,fs);

nceps=12; %MFCC�̎���

framesize=500; %�t���[����
frameshift=100; %�t���[���V�t�g

%���ʃf�[�^��MFCC�����ʂ𒊏o����
target=mymfcc_learning(Y,Fs,framesize,frameshift,nceps);

%�w�K�f�[�^�Ǝ��ʃf�[�^�̓����ʂ̍���o�^����
diff=[];
for data=1:n
    diff(:,:,data)=learn(:,:,data)-target; %�����v�Z
end

%�w�K�f�[�^�̒��Ŏ��ʃf�[�^�Ƃ̓����ʂ̍����ŏ��Ȃ��̂������z��ɓo�^����
diff=abs(diff); %���̐�Βl���Ƃ�
[C,I]=min(diff,[],3); %���̍ŏ��l�Ƃ��̃C���f�b�N�X
I(C<=0)=NaN; %���̍ŏ��l���O�̂��͎̂g�p���Ȃ��̂ŁANaN�ɂ���

%�w�K�f�[�^�Ǝ��ʃf�[�^�̈�v�����Z�o����
rec=[];
for data=1:n
    rec(data)=length(I(I==data));
end
rate=rec.*(1/sum(rec));
r=round(rate,2,'significant') %�L������2��
