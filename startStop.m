fprintf( '*****************************\n' );
fprintf( 'Alpha Start Stop Motive Script\n\n' );
%%% To exit program enter 'CTRL + c' in the Command Window %%%

% Create instance of a NatNet oject, c, and connect to Motive.
c = natnet;
c.IsReporting = 1;
c.connect;

totalTime = 7741;     % In seconds to be decremented by recordTime.
recordTime = 300;     % Take record time in seconds.
take = 1;             % Counter.

% Run start and stop loop until total time remaining reaches 0.
while totalTime > 0
    
    c.startRecord;       
    pause(recordTime); 
    c.stopRecord;
    
    % Add enough pause to sync stop command before restarting loop.
    pause(5); 

    totalTime = totalTime - recordTime;
    fprintf('Take count %d\n', take);
    fprintf('Record time remaining HH:MM:SS -> ');
    fprintf(sec2hms(totalTime));
    fprintf('\n') ;
    take = take + 1;
    
end

% Disconnect from Motive
% c.disconnect;
