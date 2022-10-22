close
clear
clc

Robot.Position = [4, 4];
Robot.theta = 31;

RL = [cosd(90) -sind(90); sind(90) cosd(90)];
RR = -RL;

Robot.Sensors.Front = [Robot.Position(1) + cosd(Robot.theta), Robot.Position(2) + sind(Robot.theta)];
Robot.Sensors.Vectors.Front = Robot.Sensors.Front - Robot.Position;

Robot.Sensors.Right = (Robot.Sensors.Vectors.Front*RL)+Robot.Position;
Robot.Sensors.Vectors.Right = Robot.Sensors.Right - Robot.Position;

Robot.Sensors.Left = (Robot.Sensors.Vectors.Front*RR)+Robot.Position;
Robot.Sensors.Vectors.Left = Robot.Sensors.Left - Robot.Position;


figure(1)
hold on
grid
plot(Robot.Position(1), Robot.Position(2), 'o')
plot([Robot.Position(1) Robot.Sensors.Front(1)],[Robot.Position(2) Robot.Sensors.Front(2)])
plot([Robot.Position(1) Robot.Sensors.Left(1)],[Robot.Position(2) Robot.Sensors.Left(2)])
plot([Robot.Position(1) Robot.Sensors.Right(1)],[Robot.Position(2) Robot.Sensors.Right(2)])
hold off