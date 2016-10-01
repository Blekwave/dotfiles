command --search gem >/dev/null; and begin
    set -gx PATH (gem environment gempath | sed "s/:/\n/g" | head -n 1)/bin $PATH
end;
