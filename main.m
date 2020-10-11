close all; clear; clc; clf;
%--------------------------------------------------------------------------
TIME_START = 0;
TIME_END = 1000000.0;
dTIME = 1.0;
ID_FIG = 1;
TOT_PARTICLES = 5;

box = BOX(200, 200, [0, 0]);
%p1 = PARTICLE([100; 100], 1.0, 0.0);
%p1.addLoad([0.1; -1]);

part = PARTICLE.empty;
for i = 1:TOT_PARTICLES
  part(i) = PARTICLE([rand * 200; rand * 200], 1.0, 0.0);
  part(i).addLoad([rand * 0.5; -1]);
end


%--------------------------------------------------------------------------
iDraw = 1;
TOT_INC = fix((TIME_END - TIME_START) / dTIME);
% DYNAMIC SOLVER
time = TIME_START;
for it=1:TOT_INC
  %
  %p1.addLoad([0.1; 0]);
  %p1.update(dTIME, box);
  %fprintf('X[2] = %f\n', p1.x(2));
  for i = 1:TOT_PARTICLES
    part(i).update(dTIME, box);
  end
  %draw
  if (it > iDraw)
    box.draw(ID_FIG);
    %p1.draw(ID_FIG);
    for i = 1:TOT_PARTICLES
      part(i).addLoad([rand * 0.1; 0]);
      part(i).draw(ID_FIG);
    end
    iDraw = iDraw + 5;
  end
  %update time
  time = time + dTIME;
  fprintf('time: %f\n', time);
end
%--------------------------------------------------------------------------