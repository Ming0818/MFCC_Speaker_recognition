%�����̐l���̉����f�[�^���w�K�f�[�^�Ƃ��ēo�^����

 %�������@
 %(1)�w�K�f�[�^�Ɏg�p����wav�t�@�C���̖��O����͂��Ă��� ex) a1='vswomen1.wav';
 %(2)�R�}���h�E�B���h�E��learn=[]�����s���Alearn�̒l�����Z�b�g���Ă���
 %(3)audioread�̈����Ɋw�K�f�[�^��a1����͂��A��=1�Ƃ��v���O�������s����
 %(4)(3)��a2,n=2�ōēx���s����
 %(5)�o�^�����f�[�^�̐��܂�(4)�̂悤�ɐ��l��������₵�Ď��s���Ă���

 %Fs, nceps, framesize, frameshift��mymfcc_recognition.m�ƈꏏ�ɂ���

%�w�K�f�[�^
%�t�@�C�����̐擪��vk���u����ɂ��́v�Avs���u���悤�Ȃ�v
%����ɂÂ�women������1�`5,men���j��1�`5
%���̌��_2�Ƃ��Ă���̂����ʗp�̃f�[�^(mymfcc_recognition.m�Ŏg��)
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

%�����f�[�^���ЂƂ��ǂݎ��
[y, fs] = audioread(a10);
n=10; %�f�[�^�ɍ��킹�ĂЂƂ����₵�Ă���

%���T���v��
Fs=16000; %�T���v�����O���g��
y = resample(y,Fs,fs);

nceps=12; %MFCC�̎���

framesize=500; %�t���[����
frameshift=100; %�t���[���V�t�g

%MFCC�����ʂ�o�^
learn(:,:,n)=mymfcc_learning(y,Fs,framesize,frameshift,nceps);

