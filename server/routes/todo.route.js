const router = require('express').Router();
const TodoModel = require('../model/todo.model')




router.post('/createTodo', async (req, res) => {
    try {
        const { title, description } = req.body;
        const todo = new TodoModel({ title, description });
        await todo.save();
        res.status(201).json({ todo, message: 'todo created successfully' });
    } catch (error) {
        console.error('Error registering user:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.put('/updateTodo', async (req, res) => {
    try {
        const { id, title, description } = req.body;
        const todo = await TodoModel.findById(id);

        if (!todo) {
            return res.status(404).json({ error: "Todo not found" })
        }

        todo.title = title;
        todo.description = description;
        await todo.save();

        res.status(200).json({ message: "Todo updated successfully" })
    } catch (error) {
        console.log(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }

})
router.delete('/deleteTodo', async (req, res) => {
    try {
        const { id } = req.query;

        // Check if the todo exists
        const todo = await TodoModel.findById(id);
        if (!todo) {
            return res.status(404).json({ error: 'Todo not found' });
        }

        // Delete the todo
        await TodoModel.findByIdAndDelete(id);
        res.status(200).json({ message: 'Todo deleted successfully' });
    } catch (error) {
        console.error('Error deleting todo:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


router.get('/getTodos', async (req, res) => {
    try {
        // const todos = await TodoModel.find({});
        const todos = await TodoModel.find().sort({ createdAt: -1 });
        res.status(200).json(todos)
    } catch (error) {
        console.log(error);
        res.status(500).json({ error: "Something Went wrong" })
    }
})
module.exports = router;