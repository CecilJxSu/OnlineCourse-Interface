#### 数据库answer表的字段answer存储结构如下，后面会有详细说明：
```typescript
//结构：
interface AnswerSheet[];

//例子：
[{
    type: "判断题",
    answers: [["T"],[""],["F"],[""]],
    totalScore: 2.0
},{
    type: "单选题",
    answers: [["A"],[""],["D"],[""]],
    totalScore: 4.0
}]

//-------------------------- AnswerSheet对象 ----------------------------
interface AnswerSheet {
    type: "判断题" | "单选题" | "多选题" | "填空题";
    answers: Answer[];
    totalScore: number;
};

//说明：
{
    type: "答题类型";
    answers: "答案数组";
    totalScore: "该答题类型的答案总分数";
}

//例子:
{
    type: "判断题",
    answers: [["T"],[""],["F"],[""]],
    totalScore: 2.0
}

//--------------------------- Answer对象 ----------------------------
interface Answer {
    [index: number]: string;
}

//说明：
//Answer对象是字符串数组

//例子1，漏填:
answer = [""];

//例子2，判断题:
answer = ["T"];

//例子3，判断题:
answer = ["F"];

//例子4，单选题:
answer = ["A"];

//例子5，多选题:
answer = ["A","B","C","D"];

//例子6，填空题:
answer = ["2"];
```
