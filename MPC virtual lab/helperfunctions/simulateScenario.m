function simulateScenario(simulationTime,waypoints,Vx,roadLength)

sampleTime = 0.1;
vsp = 15;
simlatency = 0.1; %increase for slower sim

scenario = drivingScenario("SampleTime",0.1);
simTime = (0:sampleTime:simulationTime)';  
roadCenters = [-15 2 0; roadLength 2 0];
dashW = laneMarking('Dashed','Space',5);
lnspec = lanespec(2,'Marking',dashW,'Width',4);
road(scenario, roadCenters,'Lanes',lnspec);
egoVehicle = vehicle(scenario,'ClassID',1,'Position',[0 0 0]);

smoothTrajectory(egoVehicle,waypoints,vsp)

plot(scenario);
set(gcf, 'Visible','on')

ButtonH=uicontrol('Style','pushbutton',...
    'String','Play','Units','normalized',...
    'Visible','on',...
    'callback',{@playButton,scenario});
    
    function playButton(src,event,scenario)
        while advance(scenario)
            pause(simlatency) 
        end
    end

end

