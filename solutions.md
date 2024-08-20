# Skyward DevOps Challenge

This was a pretty solid challenge overall and even had me learning a few new things.  Hopefully my work here is solid..

I do believe I've managed to successfully achieve nearly all primary and optional objectives.  The only item I am slightly concerned about is the optional step to "Pass coverage with dive".  For some reason I couldn't get it to run no matter how I set things up.  The closest I got resulted in repeatedly receiving an "access denided" error on the .dive-ci file, which was weird considering my user/group owned it and I tried every single permutation of permission I could think of.. even tried creating a new file, nada. I couldn't even find any submitted issues about the problem.  Maybe someone can walk me through the resolution to this issue during the next interview? I'd love to know if I was doing something wrong or if there was some craziness going on..

Aside from the notes below, there are definitely improvements that could be made in here. The biggest example of this would be to optimize the GitHub Actions workflows to only fire off when (for this repository specifically) certain directories have changes.  This would prevent, say, building out and publishing a new Docker image if I change something as trivial as this 'solutions.md' file.

## Challenge-1
Looking back at this Python I realize where I could improve things. I sort of reinvented the wheel by hanlding the "server_address" and "server_port" variables myself instead of simply launching everything with Flask. Oh well - it works, that would just be something I'd consider as a patch for "v1.1".

## Challenge-2
You may notice a lack of infrastructure code. That's because I didn't need to setup a new kubernetes cluster to accomplish the task. I have a k3s cluster running on some old desktops I have sitting in my office, so I just used that. I didn't want to commit the code beacuse it's not entirely finished yet.  I'll happily screenshare it during our next interview if you want to see it.

## Challenge-3
Let me know how you want me to handle the cloud infrastructure.  The IAC is fully functional (and accurate, I think), but I tore everything down so I'm not incurring any charges throughout the week. I need to know if you want to see it -build- or -running- during the interview.  Keep in mind the build can take quite a while to run due mostly to waiting for the RDS Cluster to spin up (this is pretty normal in my experience).
