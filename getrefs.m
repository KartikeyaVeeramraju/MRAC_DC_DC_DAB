function ref = getrefs(t)
ref = zeros(1,length(t));
global Vout
for i = 1:length(t)
    if t(i)<=0.035
        ref(i) = Vout;
    elseif t(i)>0.035 && t(i)<=0.065
        ref(i) = 18;
    elseif t(i)>0.065 && t(i)<=0.095
        ref(i) = Vout;
    elseif t(i)>0.095 && t(i)<=0.130
        ref(i) = Vout;
    elseif t(i)>0.130
        ref(i) = 18;
    end
end
end