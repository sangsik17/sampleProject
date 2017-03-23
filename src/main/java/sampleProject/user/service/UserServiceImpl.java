package sampleProject.user.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sampleProject.user.dao.UserDAO;
import sampleProject.user.domain.User;

@Service("userService")
public class UserServiceImpl implements UserService {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "userDAO")
    private UserDAO userDAO;

    @Override
    public Boolean checkUserId(HashMap<String, Object> param) throws Exception {
        if (userDAO.selectUserId(param) > 0) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public Boolean checkUserId(User user) throws Exception {
        if (userDAO.selectUserId(user) > 0) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public void registerUser(User user) throws Exception {
        if (checkUserId(user)) {
            userDAO.insertUser(user);
        }
    }

}
