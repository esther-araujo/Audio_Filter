% Load the original audio file
[x,fs] = audioread('SinalRuidoso.wav');

% Define the duration of the section to be removed
duration_to_remove_b = 0.6; % seconds
duration_to_remove_e = 2; % seconds

% Calculate the number of samples to remove
samples_to_remove_begin = round(duration_to_remove_b * fs);
samples_to_remove_end = round(duration_to_remove_e * fs);

% Remove the first samples_to_remove samples from the audio data
y = x(samples_to_remove_begin+1:end,:);
% Remove the first samples_to_remove samples from the audio data

y2 = y(1:end-samples_to_remove_end,:);

%sound(y2, fs);
duration = length(y2)/fs;
