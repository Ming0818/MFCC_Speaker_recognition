function freq = mel2hz(mel)
freq=(exp(mel/1127)-1)*700;
end