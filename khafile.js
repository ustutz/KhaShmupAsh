let project = new Project('New Project');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addSources('Sources/Ash-Haxe/src');
resolve(project);
