function simAndObserve(Vx, out, reference)
yawRef = out.simout.signals(2).values;
YRef = out.simout.signals(1).values;
XRef = out.simout.time*Vx;
waypoints = [XRef YRef zeros(length(YRef),1)];
simulationTime = 10;
figure
simulateScenario(simulationTime,waypoints,Vx);
figure
subplot(2,1,1)
hold on
plot(reference(:,1),reference(:,2))
plot(out.tout,YRef);
legend('Ref. 1 vc 2','YRef vs tout sim.')
xlabel('Time (s)')
ylabel('Position (m)')
hold off
subplot(2,1,2)
hold on
plot(reference(:,1),reference(:,3))
plot(out.tout,yawRef);
legend('Ref. 1 vs 3','yawRef vs tout sim.')
xlabel('Time (s)')
ylabel('Yaw (rad)')
hold off
set(gcf, 'Visible','on')
end
