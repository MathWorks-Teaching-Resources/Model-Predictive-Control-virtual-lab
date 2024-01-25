function observe(out, reference)
yawRef = out.simout.signals(2).values;
YRef = out.simout.signals(1).values;
figure;
subplot(2,1,1)
hold on
plot(reference(:,1),reference(:,2))
plot(out.tout,YRef);
legend('Reference','Simulation')
xlabel('Time (s)')
ylabel('Position (m)')
hold off
subplot(2,1,2)
hold on
plot(reference(:,1),reference(:,3))
plot(out.tout,yawRef);
legend('Reference','Simulation')
xlabel('Time (s)')
ylabel('Yaw (rad)')
hold off
set(gcf, 'Visible','on')
end