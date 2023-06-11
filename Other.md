## Inspiration

I was deeply inspired to build this application by witnessing the challenges faced by individuals living with Alzheimer's disease and other forms of dementia. I saw how memory loss could profoundly impact their daily lives, making it difficult to remember important events, manage medications, and maintain routines. Witnessing the frustration and emotional toll it took on both the individuals and their loved ones, I felt compelled to create a solution that could bring support, comfort, and a sense of connection

## What it does

Me, myself & A.I is a special app that uses advanced technology like chainlink, IPFS via web3.storage, Lit protocol, Vyper Language, and langchain. It was created to help people dealing with memory loss, such as Alzheimer's, Vascular Dementia, and other types of dementia. The app aims to help users remember things they may forget. It also has a cool feature that lets users store and cherish their most treasured memories forever. Plus, there's an AI memory assistant named Iris that you can talk to! P.S that's the idea behind the name!

### UpKeeps

Upkeeps were designed with our main users in mind, providing them with a convenient way to manage their daily activities. We have created different upkeeps for medications, daily routines, and appointments to assist them. We utilize chainlink time-based triggers to send daily notifications to users, reminding them about their condition and the importance of our app in their lives. Through the support of an aide, we help users stay organized and on top of their daily tasks. Let's explore more about the aides shortly.

### Aides

Aides is a special feature incorporated into our application. The idea behind aides is to provide close support to users experiencing memory loss, assisting them in managing their upkeeps and keeping their memories updated with important events as they happen. Aides offer additional help and much more to users who suffer from dementia, giving them someone close to rely on to manage upkeeps and activities on the application.

### Iris

Iris is the dedicated memory assistant of Me, Myself & AI. Each individual can interact with Iris by providing real-time events, enabling them to revisit and discuss any forgotten memories later on. Behind the scenes, Iris utilizes the LIT protocol access control to encrypt users' memories through our core smart contract. These encrypted memories are stored on IPFS. To keep the memory updated, we leverage web3.storage's w3name, which provides us with an updatable pointer CID. This encrypted memory is then processed by langchain, allowing users to access and communicate with their decrypted memory whenever they request it.

The associated repo where all the magic is over at https://github.com/MeMyselfAndAIHub/client

### Tags

Now here's a feature that isn't just limited to our primary audience of individuals with dementia but is open to everyone. Tags offer a unique way to capture those unforgettable moments in life. Let me explain how tags work. Imagine you attend a Kendrick Lamar concert. Right after the show, you have vivid memories of the entire event. To preserve that experience, you can create a tag, let's say named 'KendrickShow23,' representing the concert. You can then add all the details about the show to the tag. Fast forward two years later, and you want to relive the emotions you felt in that moment. Thanks to the tag you created, you can engage in a conversation with Iris and inquire about the specific details you noted down. The tag's name triggers a memory, allowing you to revisit and cherish that experience. That's tags in a nutshell

## How we built it

I utilized a range of cutting-edge technologies and frameworks, including Chainlink, LIT Protocol, IPFS via web3.storage, Vyper, The Graph, Next JS, and Langchain.

To ensure timely support, I leveraged chainlink time-based triggers to remind users about their condition and highlight how our application can assist them. For secure memory storage, LIT Protocol was employed to encrypt their memories and store them on IPFS, utilizing web3.storage's w3name to enable updating the storage location pointer for each user's memory. The Graph proved invaluable for indexing and querying the events of our smart contracts. I employed Vyper and ApeWorx for developing and deploying the smart contracts, while Next JS served as the framework for the frontend. To manage responses from Iris regarding memory requests, I relied on Langchain and OpenAI.

By integrating these advanced technologies, we aimed to create a comprehensive and efficient platform that addresses the needs of our users and provides them with reliable support for their memory-related challenges.

## Challenges we ran into

Privacy and Security: Safeguarding sensitive user data and ensuring the privacy of personal information can be a significant challenge. Implementing encryption mechanisms, secure storage solutions, and following best practices for data protection are crucial considerations.

Integration of Multiple Technologies: Integrating various technologies such as Chainlink, LIT Protocol, IPFS via web3.storage, and others can be complex. Ensuring seamless communication and interoperability between different components of the application may require thorough testing and debugging.

## What we learned

We learned about some interesting statistics about people suffering from dementia that we never knew before embarking on the project.

### Some Interesting Stats

Today, more than 55 million people worldwide have been diagnosed with dementia and it is believed that the number will increase by 10 million every year according to new data published by the World Health Organization (WHO). Dementia has also become the 7th leading cause of death worldwide. This makes it one of the biggest healthcare challenges we face as a society. A healthcare challenge which is still surrounded by a great deal of stigma. Read for more - https://www.quantib.com/blog/dementia-ai, https://www.who.int/news-room/fact-sheets/detail/dementia

Alzheimer's Disease International estimates that there is a new case of dementia every three seconds globally. Read for more - https://www.alzint.org/about/dementia-facts-figures/dementia-statistics/
