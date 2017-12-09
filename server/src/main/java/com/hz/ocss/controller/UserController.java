package com.hz.ocss.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户控制器
 *
 * @author hzxiao
 * @date 2017/12/09
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/login.do")
    public String login() {
        return "hello";
    }
}
