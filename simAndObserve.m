function simAndObserve(Vx, out, reference)
yawRef = out.simout.signals(2).values;
YRef = out.simout.signals(1).values;
XRef = out.simout.time*Vx;
waypoints = [XRef YRef zeros(length(YRef),1)];
simulationTime = 10;
%figure(1)
simulateScenario(simulationTime,waypoints,Vx);


%figure;
%add labels and fix not having own figure issue
subplot(2,1,1)
hold on
plot(reference(:,1),reference(:,2))
plot(out.tout,YRef);
hold off
subplot(2,1,2)
hold on
plot(reference(:,1),reference(:,3))
plot(out.tout,yawRef);
hold off
end