function [] = wavconverter(selectedNoiseIndex)
    disp(selectedNoiseIndex);

    switch selectedNoiseIndex
        case "0"
            selectedNoise = 'reference.wav';
        case "1"
            selectedNoise = 'istiklal.wav';
        otherwise
            error('Invalid selectedNoiseIndex');
    end

    disp(['Selected noise file: ', selectedNoise]);

    % Check if the file exists
    if ~isfile(selectedNoise)
        error(['File not found: ', selectedNoise]);
    end

    % Process the selected .wav file and write the .txt file
    try
        processWavFile(selectedNoise);
    catch ME
        error(['Error processing the file: ', ME.message]);
    end
end

function [] = processWavFile(selectedNoise)
    % Read the .wav file
    [data, Fs] = audioread(selectedNoise);

    % Resample the data to 8000 Hz if necessary
    if Fs ~= 8000
        data = resample(data, 8000, Fs);
    end

    % Normalize data to range [-1, 1] if not already in this range
    data = data / max(abs(data));

    % Define the number of bits for quantization
    bits = 16;

    % Define the partition for quantization
    partition = linspace(-1, 1, 2^bits - 1);
    codebook = linspace(-1, 1, 2^bits);

    % Quantize the data
    [~, indx] = quantiz(data, partition, codebook);

    % Debug: Print some quantized indices
    disp('Sample quantized indices:');
    disp(indx(1:10)); % Display first 10 indices

    % Write the binary data to a .txt file
    [~, name, ~] = fileparts(selectedNoise);
    outputFileName = [name, '_output.txt'];
    fid = fopen(outputFileName, 'w');
    if fid == -1
        error(['Cannot open file: ', outputFileName]);
    end

    try
        fprintf(fid, '%d\n', indx);
    catch ME
        fclose(fid);
        error(['Error writing to file: ', ME.message]);
    end
    
    fclose(fid);
    disp(['Quantized indices have been written to ', outputFileName]);
end
