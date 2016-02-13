clear
A = 1;%Drift rate
c = 1;%noise
y0 = 0;%Inital condition
z = 0.5;
T0 = 0.5;

dt = 0.01;
y(1) = y0;
i = 1;

while (y(i) < z) & (y(i) > -z)
    r = randn(1);
    dW=sqrt(dt)*r;
    dy=A*dt+c*dW;
    y(i+1)=y(i)+dy;
    i = i + 1;
end

disp(['Reaction Time = ' num2str(T0+dt*i)])
disp(['The threashold that was crossed was ' num2str(z*sign(y(i)))])