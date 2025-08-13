title=Ampt
tags=tool, cloud, aws
summary=Helps teams build, scale, and manage JavaScript apps on AWS by automatically configuring and optimizing cloud environments.
~~~~~~

[Website](https://www.getampt.com/) | [Source](https://github.com/getampt)

Ampt automatically provisions, manages, and optimizes cloud environments on AWS. They are fully-managed, highly-secure, completely isolated, and come pre-configured with all the cloud resources you need to deploy and scale modern apps.

```
// Import your favorite Node.js libraries and the Ampt SDK
import axios from 'axios';
import { task } from '@ampt/sdk';

// Write your business logic
const fetchData = async () => {
  const response = await axios.get('https://api.my-saas.com');
  // Do something with this data
}

// Create a 'task' handler
const myTask = task('Fetch Sample Data', fetchData)

// Schedule it to run every hour
myTask.every("1 hour")
```

