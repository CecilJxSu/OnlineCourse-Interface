#### 数据库question表的字段questions存储结构如下，后面会有详细说明：
```typescript
//结构：
interface Test[];

//例子：
[{
	type: "判断题",
	questions: [{
	    type: "判断题",
	    question: "1 + 1 = 2",

	    answer: ["T"],

	    explains: string - "1 + 1 = 2，T = 对，F = 错"
	},{
		type: "判断题",
	    question: "1 + 1 = 2",

	    answer: ["T"],

	    explains: string - "1 + 1 = 2，T = 对，F = 错"
	}],
	score: 1.0
}]
```
#### 可以根据Test.score排序，显示在屏幕上面，比如：
#### 判断题score = 1；单选题score = 2；多选题score = 4；填空题score = 2；
#### 则显示顺序：判断题，单选题，填空题，多选题；也可以不排序，按数组顺序依次显示；
#### score是单项分数;

```typescript
//-------------------------- Test对象 ----------------------------
interface Test {
	type: "判断题" | "单选题" | "多选题" | "填空题";
	questions: Question[];
	score: number;
};

//说明：
{
	type: "题目类型";
	questions: "题目数组";
	score: "题目单项分数";
}

//例子:
{
	type: "判断题",
	questions: [{
	    type: "判断题",
	    question: "1 + 1 = 2",

	    answer: ["T"],

	    explains: string - "1 + 1 = 2，T = 对，F = 错"
	},{
		type: "判断题",
	    question: "1 + 1 = 2",

	    answer: ["T"],

	    explains: string - "1 + 1 = 2，T = 对，F = 错"
	}],
	score: 1.0
}

//--------------------------- Question对象 ----------------------------
interface Question {
    type: "判断题" | "单选题" | "多选题" | "填空题";
    question: string;

    answer: string[];

    item?: Map<String,String>;
    explains: string;
    url?: string;
}

//说明：
{
	type: "题目类型";
	question: "问题描述";
	answer: "问题答案";
	item: "问题选项；可选，比如：判断题、填空题可以省略";
	explains: "答案解释";
	url: "图片资源，看图题，需要图片资源，可选";
}

//例子1:
question = {
    type: "判断题",
    question: "1 + 1 = 2",

    answer: ["T"],

    explains: string - "1 + 1 = 2，T = 对，F = 错"
}

//例子2:
question = {
    type: "单选题",
    question: "如图所示，1 + 1 = ?",

    answer: ["A"],

    item: { A: "2", B: "3", C: "5", D: "6" },
    explains: string - "1 + 1 = 2",
    url: string - "http://url.com"
}

//例子3:
question = {
    type: "多选题",
    question: "如图所示，1 + 1 = ?",

    answer: ["A","B","C","D"],

    item: { A: "2", B: "1", C: "0", D: "10" },
    explains: string - "二进制，八/十/十六进制，与，进位",
    url: string - "http://url.com"
}

//例子4:
question = {
    type: "填空题",
    question: "1 + 1 = ____",

    answer: ["2"],

    explains: string - "1 + 1 = 2"
}
```
