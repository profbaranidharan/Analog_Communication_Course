% MATLAB code to demonstrate different sampling rates relative to Nyquist rate
% with user input for sampling frequency (f_s) and maximum frequency (W).

% Get user input for the sampling frequency and the maximum frequency of the analog signal
f_s = input('Enter the sampling frequency (f_s in Hz): ');   % Sampling frequency
W = input('Enter the maximum frequency of the analog signal (W in Hz): ');  % Maximum frequency

% Define the duration of the signal
duration = input('Enter the duration of the signal (duration in seconds): ');  % Duration

% Time vector for the analog signal (high-resolution)
t_analog = 0:1/1000:duration;    % High-resolution time vector for analog signal (continuous)

% Time vectors for different sampling scenarios (with user input)
t_sampled = 0:1/f_s:duration;    % Time vector for sampled signal with fs input
x_analog = sin(2*pi*W*t_analog); % Analog signal (sine wave with max frequency W)

% Sample the signal using the user-defined sampling rate (f_s)
x_sampled = sin(2*pi*W*t_sampled);  % Sampled signal

% Calculate actual sampling rate based on user input
fs_actual = 1 / mean(diff(t_sampled));  % Actual sampling rate

% Determine the case based on fs and W
if fs_actual < 2 * W
    sampling_case = 'Aliasing: fs < 2W';
elseif fs_actual == 2 * W
    sampling_case = 'Nyquist Rate: fs = 2W';
else
    sampling_case = 'No Aliasing: fs > 2W';
end

% Plot the analog signal and the sampled signal
figure;

% Analog Signal (continuous signal)
subplot(2,1,1);
plot(t_analog, x_analog, 'b', 'LineWidth', 1.5);
title('Analog Signal x(t)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Sampled Signal based on user input fs
subplot(2,1,2);
stem(t_sampled, x_sampled, 'r', 'LineWidth', 1.5);
title(['Sampled Signal (' sampling_case ')']);
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Display information about the signal and sampling rates
fprintf('Analog signal maximum frequency W: %.2f Hz\n', W);
fprintf('Sampling frequency (fs): %.2f Hz\n', fs_actual);
fprintf('Sampling case: %s\n', sampling_case);
